<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pulse Gym | Fitness Redefined</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Oswald:wght@500;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-black: #0a0a0a;
            --secondary-black: #1a1a1a;
            --dark-gray: #2d2d2d;
            --medium-gray: #4a4a4a;
            --light-gray: #e0e0e0;
            --accent-green: #2ecc71;
            --accent-dark-green: #27ae60;
            --white: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-black);
            color: var(--light-gray);
            overflow-x: hidden;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Oswald', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .navbar {
            background-color: rgba(10, 10, 10, 0.95) !important;
            border-bottom: 2px solid var(--accent-green);
            padding: 15px 0;
            transition: all 0.3s ease;
        }

        .navbar.scrolled {
            padding: 10px 0;
            background-color: var(--primary-black) !important;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--white) !important;
        }

        .navbar-brand span {
            color: var(--accent-green);
        }

        .nav-link {
            color: var(--light-gray) !important;
            font-weight: 500;
            margin: 0 10px;
            position: relative;
            padding: 5px 0 !important;
        }

        .nav-link:before {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--accent-green);
            visibility: hidden;
            transition: all 0.3s ease-in-out;
        }

        .nav-link:hover:before {
            visibility: visible;
            width: 100%;
        }

        .nav-link:hover {
            color: var(--accent-green) !important;
        }

        .nav-link.active {
            color: var(--accent-green) !important;
        }

        .nav-link.active:before {
            visibility: visible;
            width: 100%;
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
            url('https://images.unsplash.com/photo-1571902943202-507ec2618e8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1075&q=80');
            background-size: cover;
            background-position: center;
            height: 90vh;
            min-height: 650px;
            display: flex;
            align-items: center;
            position: relative;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 4rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            line-height: 1.1;
        }

        .hero-title span {
            color: var(--accent-green);
        }

        .hero-subtitle {
            font-size: 1.3rem;
            margin-bottom: 2.5rem;
            max-width: 600px;
        }

        .btn-green {
            background-color: var(--accent-green);
            color: var(--white);
            border: none;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
        }

        .btn-green:hover {
            background-color: var(--accent-dark-green);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(46, 204, 113, 0.3);
            color: var(--white);
        }

        .btn-outline-green {
            border: 2px solid var(--accent-green);
            color: var(--accent-green);
            background-color: transparent;
            font-weight: 600;
            padding: 10px 28px;
            border-radius: 30px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
        }

        .btn-outline-green:hover {
            background-color: var(--accent-green);
            color: var(--white);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(46, 204, 113, 0.3);
        }

        .section-title {
            position: relative;
            display: inline-block;
            margin-bottom: 3rem;
        }

        .section-title:after {
            content: '';
            position: absolute;
            width: 50%;
            height: 4px;
            background: var(--accent-green);
            bottom: -10px;
            left: 0;
        }

        .feature-card {
            background-color: var(--secondary-black);
            border-radius: 8px;
            padding: 30px;
            height: 100%;
            transition: all 0.4s;
            border-left: 4px solid transparent;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            border-left: 4px solid var(--accent-green);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--accent-green);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .feature-card:hover .feature-icon {
            transform: scale(1.2);
        }

        .feature-title {
            color: var(--white);
            margin-bottom: 15px;
        }

        .stats-section {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            padding: 80px 0;
            position: relative;
        }

        .stat-item {
            text-align: center;
            padding: 30px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            color: var(--accent-green);
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .testimonials-section {
            background-color: var(--secondary-black);
            padding: 80px 0;
        }

        .testimonial-card {
            background-color: var(--dark-gray);
            border-radius: 8px;
            padding: 25px;
            margin: 15px;
            position: relative;
            border-left: 4px solid var(--accent-green);
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
        }

        .testimonial-author {
            font-weight: 700;
            color: var(--accent-green);
        }

        .testimonial-rating {
            color: var(--accent-green);
            margin-bottom: 10px;
        }

        .cta-section {
            background: linear-gradient(135deg, var(--primary-black) 0%, var(--dark-gray) 100%);
            padding: 70px 0;
            border-top: 2px solid var(--accent-green);
            border-bottom: 2px solid var(--accent-green);
        }

        .cta-title {
            font-size: 2.3rem;
            margin-bottom: 20px;
        }

        .cta-subtitle {
            font-size: 1.1rem;
            margin-bottom: 30px;
            opacity: 0.9;
        }

        footer {
            background-color: var(--primary-black);
            padding: 50px 0 20px;
            position: relative;
        }

        .footer-logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--white);
            margin-bottom: 20px;
        }

        .footer-logo span {
            color: var(--accent-green);
        }

        .footer-links h5 {
            color: var(--accent-green);
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        .footer-links h5:after {
            content: '';
            position: absolute;
            width: 50px;
            height: 2px;
            background: var(--accent-green);
            bottom: 0;
            left: 0;
        }

        .footer-links ul {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: var(--light-gray);
            text-decoration: none;
            transition: all 0.3s;
        }

        .footer-links a:hover {
            color: var(--accent-green);
            padding-left: 5px;
        }

        .social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-color: var(--dark-gray);
            color: var(--light-gray);
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            transition: all 0.3s;
        }

        .social-icons a:hover {
            background-color: var(--accent-green);
            color: var(--white);
            transform: translateY(-5px);
        }

        .copyright {
            border-top: 1px solid var(--medium-gray);
            padding-top: 20px;
            margin-top: 30px;
            text-align: center;
        }

        .trainer-card {
            background-color: var(--secondary-black);
            border-radius: 8px;
            padding: 25px;
            transition: all 0.3s;
            height: 100%;
            border-left: 4px solid transparent;
        }

        .trainer-card:hover {
            transform: translateY(-5px);
            border-left: 4px solid var(--accent-green);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .trainer-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--accent-green);
            margin: 0 auto 20px;
            display: block;
        }

        .badge.bg-green {
            background-color: var(--accent-green);
            color: var(--white);
            margin-right: 5px;
            font-weight: 500;
        }

        /* Animation */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .pulse-animation {
            animation: pulse 2s infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .hero-title {
                font-size: 3.2rem;
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            .hero-subtitle {
                font-size: 1.1rem;
            }
            .stat-item {
                padding: 20px;
            }
            .stat-number {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            PULSE<span>GYM</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addMember.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewPlans.jsp"><i class="fas fa-list-alt me-1"></i> Plans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="publicTrainers.jsp"><i class="fas fa-users me-1"></i> Trainers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="publicClassSchedule.jsp"><i class="fas fa-calendar-alt me-1"></i> Classes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loginMember.jsp"><i class="fas fa-sign-in-alt me-1"></i> Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="hero-content">
            <h1 class="hero-title">IGNITE YOUR <span>POTENTIAL</span></h1>
            <p class="hero-subtitle">Discover a new level of fitness with our cutting-edge facilities, expert trainers, and personalized training programs designed for all fitness levels.</p>
            <div class="d-flex flex-wrap gap-3">
                <a href="addMember.jsp" class="btn btn-green pulse-animation"><i class="fas fa-user-plus me-2"></i> JOIN NOW</a>
                <a href="viewPlans.jsp" class="btn btn-outline-green"><i class="fas fa-info-circle me-2"></i> OUR PLANS</a>
                <a href="publicClassSchedule.jsp" class="btn btn-outline-green"><i class="fas fa-calendar-alt me-2"></i> CLASS SCHEDULE</a>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5" style="background-color: var(--dark-gray);">
    <div class="container py-5">
        <h2 class="section-title text-white">WHY CHOOSE PULSE GYM</h2>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-dumbbell"></i>
                    </div>
                    <h3 class="feature-title">MODERN EQUIPMENT</h3>
                    <p>State-of-the-art fitness equipment from leading brands to support your training goals and maximize results.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-user-tie"></i>
                    </div>
                    <h3 class="feature-title">EXPERT TRAINERS</h3>
                    <p>Certified professionals with years of experience to guide you through personalized training programs.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <h3 class="feature-title">FLEXIBLE PLANS</h3>
                    <p>Membership options to suit every schedule and budget, with no long-term commitments required.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h3 class="feature-title">GROUP CLASSES</h3>
                    <p>Diverse class schedule including HIIT, yoga, cycling, and strength training for all fitness levels.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="feature-title">SUPPORTIVE COMMUNITY</h3>
                    <p>Join a welcoming environment where members motivate and inspire each other to achieve their goals.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <h3 class="feature-title">PROVEN RESULTS</h3>
                    <p>Our training methods are scientifically proven to help you achieve measurable fitness improvements.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Trainers Section -->
<section class="py-5" style="background-color: var(--secondary-black);">
    <div class="container py-5">
        <h2 class="section-title text-white">MEET OUR TRAINERS</h2>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="trainer-card">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Trainer" class="trainer-img">
                    <h3 class="feature-title">MARK JOHNSON</h3>
                    <p>Strength & Conditioning coach with 8 years experience helping clients build muscle and strength.</p>
                    <div class="mt-3">
                        <span class="badge bg-green">Strength</span>
                        <span class="badge bg-green">Bodybuilding</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="trainer-card">
                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Trainer" class="trainer-img">
                    <h3 class="feature-title">LISA PARKER</h3>
                    <p>Functional fitness expert specializing in mobility, agility, and overall athletic performance.</p>
                    <div class="mt-3">
                        <span class="badge bg-green">Functional</span>
                        <span class="badge bg-green">Mobility</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="trainer-card">
                    <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Trainer" class="trainer-img">
                    <h3 class="feature-title">SOPHIA LEE</h3>
                    <p>Yoga and Pilates instructor focused on improving flexibility, balance, and mental wellbeing.</p>
                    <div class="mt-3">
                        <span class="badge bg-green">Yoga</span>
                        <span class="badge bg-green">Pilates</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="publicTrainers.jsp" class="btn btn-outline-green">View All Trainers</a>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="stats-section">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">12+</div>
                    <div class="stat-label">Certified Trainers</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">8K+</div>
                    <div class="stat-label">Sq Ft Space</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">3K+</div>
                    <div class="stat-label">Members</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">50+</div>
                    <div class="stat-label">Weekly Classes</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="testimonials-section">
    <div class="container">
        <h2 class="section-title text-white">MEMBER SUCCESS STORIES</h2>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonial-text">"Pulse Gym has completely transformed my approach to fitness. The trainers are knowledgeable and the community is incredibly supportive."</p>
                    <div class="testimonial-author">- James T.</div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonial-text">"The variety of classes keeps me motivated, and I've seen amazing results in just three months. Highly recommend!"</p>
                    <div class="testimonial-author">- Emily S.</div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="testimonial-text">"Clean facilities, friendly staff, and excellent equipment. Pulse Gym has everything I need for my fitness journey."</p>
                    <div class="testimonial-author">- Robert K.</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action Section -->
<section class="cta-section">
    <div class="container text-center">
        <h2 class="cta-title">READY TO START YOUR FITNESS JOURNEY?</h2>
        <p class="cta-subtitle">Take the first step towards a healthier, stronger you with our expert guidance and support.</p>
        <div class="d-flex justify-content-center flex-wrap gap-3">
            <a href="addMember.jsp" class="btn btn-green btn-lg"><i class="fas fa-user-plus me-2"></i> JOIN NOW</a>
            <a href="viewPlans.jsp" class="btn btn-outline-green btn-lg"><i class="fas fa-list-alt me-2"></i> VIEW PLANS</a>
            <a href="publicTrainers.jsp" class="btn btn-outline-green btn-lg"><i class="fas fa-user-tie me-2"></i> MEET TRAINERS</a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="footer-logo">PULSE<span>GYM</span></div>
                <p>Your premier fitness destination offering top-tier training facilities, expert coaching, and a supportive community to help you achieve your goals.</p>
                <div class="social-icons mt-3">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-4">
                <div class="footer-links">
                    <h5>Quick Links</h5>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="addMember.jsp">Register</a></li>
                        <li><a href="viewPlans.jsp">Plans</a></li>
                        <li><a href="publicTrainers.jsp">Trainers</a></li>
                        <li><a href="publicClassSchedule.jsp">Classes</a></li>
                        <li><a href="loginMember.jsp">Member Login</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="footer-links">
                    <h5>Facilities</h5>
                    <ul>
                        <li><a href="#">Strength Area</a></li>
                        <li><a href="#">Cardio Zone</a></li>
                        <li><a href="#">Functional Training</a></li>
                        <li><a href="#">Group Classes</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="footer-links">
                    <h5>Contact Us</h5>
                    <ul>
                        <li><i class="fas fa-map-marker-alt me-2"></i> 456 Fitness Ave, City</li>
                        <li><i class="fas fa-phone me-2"></i> (555) 987-6543</li>
                        <li><i class="fas fa-envelope me-2"></i> info@pulsegym.com</li>
                        <li><i class="fas fa-clock me-2"></i> Mon-Fri: 5am-11pm</li>
                        <li><i class="fas fa-clock me-2"></i> Sat-Sun: 7am-9pm</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2023 PULSE GYM. ALL RIGHTS RESERVED.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script>
    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
</script>
</body>
</html>