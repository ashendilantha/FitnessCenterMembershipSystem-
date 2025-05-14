package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;

import java.io.*;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Member;

public class MemberDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/Hansana/members.txt";
    private Queue<Member> renewalQueue = new LinkedList<>();

    public void addMember(Member member) {
        if (member == null || member.getMemberId() == null || member.getName() == null || member.getEmail() == null) {
            throw new IllegalArgumentException("Invalid member data");
        }
        System.out.println("Adding new member: " + member.getMemberId());
        System.out.println("Writing to file: " + member.toString());
        ensureFileExists();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(member.toString());
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
            throw new RuntimeException("Failed to add member", e);
        }
    }

    public List<Member> getAllMembers() {
        List<Member> members = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            return members;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;

                String[] data = line.split(",");
                if (data.length < 7) {
                    System.err.println("Skipping invalid line: " + line);
                    continue;
                }

                try {
                    LocalDate lastRenewalDate = data[6].isEmpty() ? null : LocalDate.parse(data[6]);
                    LocalDate lastPaymentDate = data.length > 7 && !data[7].isEmpty() ? LocalDate.parse(data[7]) : null;

                    Member member = new Member(
                            data[0], data[1], data[2], data[3],
                            data[4], data[5], lastRenewalDate, lastPaymentDate
                    );
                    members.add(member);
                } catch (Exception e) {
                    System.err.println("Skipping malformed entry: " + line);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
            throw new RuntimeException("Failed to read members", e);
        }
        return members;
    }

    public void updateMember(Member updatedMember) {
        List<Member> members = getAllMembers();
        boolean found = false;

        for (int i = 0; i < members.size(); i++) {
            if (members.get(i).getMemberId().equals(updatedMember.getMemberId())) {
                members.set(i, updatedMember);
                found = true;
                break;
            }
        }

        if (found) {
            saveAllMembers(members);
        } else {
            throw new IllegalArgumentException("Member not found: " + updatedMember.getMemberId());
        }
    }

    public boolean deleteMember(String memberId) {
        List<Member> members = getAllMembers();
        boolean removed = members.removeIf(member -> member.getMemberId().equals(memberId));

        if (removed) {
            saveAllMembers(members);
            return true;
        }
        return false;
    }

    public List<Member> sortMembersByRenewalDate(List<Member> members) {
        return members.stream()
                .sorted(Comparator.comparing(
                        Member::getLastRenewalDate,
                        Comparator.nullsLast(Comparator.naturalOrder())
                ))
                .collect(Collectors.toList());
    }

    public Member authenticate(String email, String password) {
        return getAllMembers().stream()
                .filter(m -> m.getEmail().equals(email) && m.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }

    public boolean emailExists(String email) {
        return getAllMembers().stream()
                .anyMatch(m -> m.getEmail().equalsIgnoreCase(email));
    }

    public void addToRenewalQueue(Member member) {
        renewalQueue.add(member);
    }

    public Member processRenewalMemberRequest() {
        return renewalQueue.poll();
    }

    public void updateLastPaymentDate(String memberId, LocalDate paymentDate) {
        Member member = getMemberById(memberId);
        if (member != null) {
            member.setLastPaymentDate(paymentDate);
            updateMember(member);
        } else {
            throw new IllegalArgumentException("Member not found: " + memberId);
        }
    }

    public Member getMemberById(String memberId) {
        return getAllMembers().stream()
                .filter(m -> m.getMemberId().equals(memberId))
                .findFirst()
                .orElse(null);
    }

    private void saveAllMembers(List<Member> members) {
        ensureFileExists();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Member member : members) {
                writer.write(member.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving to file: " + e.getMessage());
            throw new RuntimeException("Failed to save members", e);
        }
    }

    private void ensureFileExists() {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                throw new RuntimeException("Failed to create members file", e);
            }
        }
    }
}