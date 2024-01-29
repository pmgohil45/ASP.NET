<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ElectricityBill.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Home Page</title>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="image/logo2.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Day - v4.8.0
  * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body class="mainBody" style="font-family:'Times New Roman';">
    <form id="form1" runat="server" autocomplete="off">
        
    <!-- ======= Top Bar ======= -->
    <section id="topbar" class="d-flex align-items-center">
        <div class="container d-flex justify-content-center justify-content-md-between">
          <div class="contact-info d-flex align-items-center">
            <i class="bi bi-envelope-fill"></i><a href="mailto:pmgohil45@gmail.com">pmgohil45@gmail.com</a>
            <i class="bi bi-phone-fill phone-icon"></i> <a href="tel:+919512240793">+91 95122 40793</a>
          </div>
          <div class="social-links d-none d-md-block">
            <a href="https://twitter.com/pm_gohil45" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="https://www.facebook.com/pm.gohil.4545" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="https://www.instagram.com/pmgohil45/" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="https://www.linkedin.com/in/pm-gohil-1554aa240/" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
          </div>
        </div>
      </section>

    <!-- ======= Header ======= -->
    <header id="header" class="d-flex align-items-center">
        <div class="container d-flex align-items-center justify-content-between">

          <h1 class="logo"><a href="index.html">PGVCL</a></h1>
          <!-- <asp:Image class="logo" ID="logoImage" ImageAlign="Left" runat="server" ImageUrl="~/image/logo2.png"/>-->
          <!-- Uncomment below if you prefer to use an image logo -->
          <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

          <nav id="navbar" class="navbar">
            <ul>
              <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
              <li><asp:LinkButton class="nav-link scrollto" ID="btnShowBill" runat="server" OnClick="btnShowBill_Click">Show Bill</asp:LinkButton></li>
              <li><a class="nav-link scrollto" href="#about">About us</a></li>
              <li><a class="nav-link scrollto" href="#services">Services</a></li>
              <li><a class="nav-link scrollto" href="#team">Team</a></li>
              <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
              <li><asp:LinkButton class="nav-link scrollto" ID="btnLogout" runat="server" OnClick="btnLogout_Click">Logout</asp:LinkButton></li>
             
          
            </ul>    
            <i class="bi bi-list mobile-nav-toggle"></i>
          </nav><!-- .navbar -->

        </div>
      </header><!-- End Header -->

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container position-relative" data-aos="fade-up" data-aos-delay="500">
          <h1>Welcome to PGVCL <asp:Label ID="labelWelcome" runat="server" Text=""></asp:Label></h1>
          <h2>Spread light in your home using our services....</h2>
          <a href="#about" class="btn-get-started scrollto">Get Started</a>
        </div>
      </section><!-- End Hero -->

    <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left">
            <img src="assets/img/about1.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right">
            <h3 style="color:#ff8788;">Why choose a PGVCL..?</h3>
            <p class="fst-italic">
                The erstwhile Gujarat Electricity Board has been restructured into seven companies.
            </p>
            <ul>
              <li><i class="bi bi-check-circle"></i> One generation (GSEC).</li>
              <li><i class="bi bi-check-circle"></i> One transmission (GETCO).</li>
              <li><i class="bi bi-check-circle"></i> Four distribution companies and GUVNL.</li>
            </ul>
            <p>
                The PGVCL is one of the distribution companies which started functioning from 1st April, 2005.
                Area served by PGVCL is the largest of all four distribution companies. The area of operation 
                under PGVCL includes Saurashtra and Kachchh regions.Gujarat Urja Vikas Nigam Ltd. is the company 
                under which all the six companies are working, created after restructuring of erstwhile GEB.
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients">
      <div class="container" data-aos="zoom-in">

        <div class="row d-flex align-items-center">

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-1.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-2.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-3.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-4.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-5.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-6.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Clients Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <span>Services</span>
          <h2>Services</h2>
          <p>PGVCL is always provides online or offline services for our consumer</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up">
            <div class="icon-box">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4><a href="">Online payment</a></h4>
              <p>  Quick payment, Quick payment status, View consumption history, View payment history, View bill history</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="fade-up" data-aos-delay="150">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4><a href=""> Apply for New connection</a></h4>
              <p>  HT connection, LT connection, LT temprarory connection</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4><a href="">Agriculture Reconnection</a></h4>
              <p>  AG reconnection without shifting, AG reconection with name change, AG shifting</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="fade-up" data-aos-delay="450">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4><a href="">Line Shifting</a></h4>
              <p> LT line shifting for existing consumer, Line shifting for nonconsumer</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="fade-up" data-aos-delay="600">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-slideshow"></i></div>
              <h4><a href="">Permanent Disconnection (PDC)</a></h4>
              <p>LT Permanent Disconnection</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="fade-up" data-aos-delay="750">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-arch"></i></div>
              <h4><a href="">Consumer Guide</a></h4>
              <p>View application user guide, Checking document required for new connection, Download forms for all categories</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Cta Section ======= -->
    <section id="cta" class="cta">
      <div class="container" data-aos="zoom-in">

        <div class="text-center">
          <h3>Call To Action</h3>
          <p>The day when we shall know exactly what electricity is will chronicle an event probably greater, 
              more important than any other recorded in the history of the human race. The time will come when 
              the comfort, the very existence, perhaps, of man will depend upon that wonderful agent.</p>
          <a class="cta-btn" href="#">Call To Action</a>
        </div>

      </div>
    </section><!-- End Cta Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <span>Team</span>
          <h2>Team</h2>
          <p>Talent wins games, but teamwork and intelligence win championships</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in">
            <div class="member">
              <img src="assets/img/team/team-1.jpg" alt="">
              <h4>Walter White</h4>
              <span>Chief Executive Officer</span>
              <p>
                There’s nothing wrong with staying small. You can do big things with a small team
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in">
            <div class="member">
              <img src="assets/img/team/team-2.jpg" alt="">
              <h4>Sarah Jhinson</h4>
              <span>Product Manager</span>
              <p>
                Don’t bunt. Aim out of the ball park. Aim for the company of immortals
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in">
            <div class="member">
              <img src="assets/img/team/team-3.jpg" alt="">
              <h4>William Anderson</h4>
              <span>CTO</span>
              <p>
                Don’t worry about people stealing your design work. Worry about the day they stop
              </p>
              <div class="social">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <span>Contact</span>
          <h2>Contact</h2>
          <p>Our contact details for the our consumer service</p>
        </div>

        <div class="row" data-aos="fade-up">
          <div class="col-lg-6">
            <div class="info-box mb-4">
              <i class="bx bx-map"></i>
              <h3>Our Address</h3>
              <p>Nana Mava Road, Rajkot-360004</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx bx-envelope"></i>
              <h3>Email Us</h3>
              <p>pmgohil45@gmail.com</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx bx-phone-call"></i>
              <h3>Call Us</h3>
              <p>+91 95122 40793</p>
            </div>
          </div>

        </div>

        <div class="row" data-aos="fade-up">

          <div class="col-lg-6 ">
            <iframe class="mb-4 mb-lg-0" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
          </div>

          <div class="col-lg-6">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form" autocomplete="off">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading...</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="footer-info">
              <h3>Day</h3>
              <p>
                Nana Mava Road,<br>
                Rajkot-360004<br><br>
                +91 95122 40793<br>
                pmgohil45@gmail.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Show Bill</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Team</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Contact</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Search Bill</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Online payment</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">New connection</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Agriculture Reconnection</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Line Shifting</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Permanent Disconnection</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Consumer Guide</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <div class="footer-links">
            <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="#">PGVCL Plans for energy conservation</a></li>
            </ul>
          </div>
            <form action="" method="post" autocomplete="off">
              <strong><input type="email" name="email" ></strong><input type="submit" value="Subscribe">
            </form>
         </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
          All Rights Reserved by <a href="#"><strong><span>PGVCL</span></strong></br></a>
          Copyright &copy; by <a href="#">2050 <strong><span>PGVCL</span></strong></a>
          
      </div>
      <div class="credits">
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a></br>
        Managed by <a href="https://pmgohil.000webhostapp.com/">Pm Gohil</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>
<!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  </form>
</body>
</html>
