<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Theme Made By www.w3schools.com - No Copyright -->
        <title>Voice Of Harmony Booking SystemS</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
                font: 400 15px/1.8 Lato, sans-serif;
                color: #777;
            }
            h3, h4 {
                margin: 10px 0 30px 0;
                letter-spacing: 10px;      
                font-size: 20px;
                color: #111;
            }
            .container {
                padding: 80px 120px;
            }
            .person {
                border: 10px solid transparent;
                margin-bottom: 25px;
                width: 80%;
                height: 80%;
                opacity: 0.7;
            }
            .person:hover {
                border-color: #f1f1f1;
            }
            .carousel-inner img {
                -webkit-filter: grayscale(90%);
                filter: grayscale(90%); /* make all photos black and white */ 
                width: 100%; /* Set width to 100% */
                margin: auto;
            }
            .carousel-caption h3 {
                color: #fff !important;
            }
            @media (max-width: 600px) {
                .carousel-caption {
                    display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
                }
            }
            .bg-1 {
                background: #2d2d30;
                color: #bdbdbd;
            }
            .bg-1 h3 {color: #fff;}
            .bg-1 p {font-style: italic;}
            .list-group-item:first-child {
                border-top-right-radius: 0;
                border-top-left-radius: 0;
            }
            .list-group-item:last-child {
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }
            .thumbnail {
                padding: 0 0 15px 0;
                border: none;
                border-radius: 0;
            }
            .thumbnail p {
                margin-top: 15px;
                color: #555;
            }
            .btn {
                padding: 10px 20px;
                background-color: #333;
                color: #f1f1f1;
                border-radius: 0;
                transition: .2s;
            }
            .btn:hover, .btn:focus {
                border: 1px solid #333;
                background-color: #fff;
                color: #000;
            }
            .modal-header, h4, .close {
                background-color: #333;
                color: #fff !important;
                text-align: center;
                font-size: 30px;
            }
            .modal-header, .modal-body {
                padding: 40px 50px;
            }
            .nav-tabs li a {
                color: #777;
            }
            #googleMap {
                width: 100%;
                height: 400px;
                -webkit-filter: grayscale(100%);
                filter: grayscale(100%);
            }  
            .navbar {
                font-family: Montserrat, sans-serif;
                margin-bottom: 0;
                background-color: #2d2d30;
                border: 0;
                font-size: 11px !important;
                letter-spacing: 4px;
                opacity: 0.9;
            }
            .navbar li a, .navbar .navbar-brand { 
                color: #d5d5d5 !important;
            }
            .navbar-nav li a:hover {
                color: #fff !important;
            }
            .navbar-nav li.active a {
                color: #fff !important;
                background-color: #29292c !important;
            }
            .navbar-default .navbar-toggle {
                border-color: transparent;
            }
            .open .dropdown-toggle {
                color: #fff;
                background-color: #555 !important;
            }
            .dropdown-menu li a {
                color: #000 !important;
            }
            .dropdown-menu li a:hover {
                background-color: red !important;
            }
            footer {
                background-color: #2d2d30;
                color: #f5f5f5;
                padding: 32px;
            }
            footer a {
                color: #f5f5f5;
            }
            footer a:hover {
                color: #777;
                text-decoration: none;
            }  
            .form-control {
                border-radius: 0;
            }
            textarea {
                resize: none;
            }
        </style>
    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#myPage">Voice of Harmony Booking System</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#myPage">HOME</a></li>
                        <li><a href="#band">ABOUT US</a></li>
                        <li><a href="#tour">BOOK NOW</a></li>
                        <li><a href="#contact">CONTACT US</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">ACCOUNT
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="myBooking.jsp">My Booking</a></li>
                                <li><a href="userEdit.jsp">Edit Profile</a></li>
                                <li><a href="index.html">Log Out</a></li> 
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="img/backdrop.jpg" alt="New York" width="1200" height="700">
                    <div class="carousel-caption">
                        <h3>Malam Galau UMT 2023</h3>
                        <p>The atmosphere was so lit.</p>
                    </div>      
                </div>

                <div class="item">
                    <img src="img/bg1.jpg" alt="Chicago" width="1200" height="700">
                    <div class="carousel-caption">
                        <h3>UMT</h3>
                        <p>Thank you, UMT - A night we won't forget.</p>
                    </div>      
                </div>

                <div class="item">
                    <img src="img/nami.jpg" alt="Los Angeles" width="1200" height="700">
                    <div class="carousel-caption">
                        <h3>DSM</h3>
                        <p>Even though the post-event was a mess, we had the best time playing at Malam Galau UMT!</p>
                    </div>      
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!-- Container (The Band Section) -->
        <div id="band" class="container text-center">
            <h3>ABOUT US</h3>
            <p><em>from The Cultural Center of UMT</em></p>
            <p>Embark on a melodious journey with the Voice of Harmony (VOH) Club, a sanctuary for diverse musical talents. Singers, musicians, composers, and performers converge with unwavering passion and dedication, seamlessly balancing their artistic fervor with academic responsibilities. VOH not only celebrates individual brilliance but also extends its offerings to the community through versatile booking services. Whether it's a professional studio, top-notch instruments, or captivating performances, VOH stands as a reliable and passionate destination. Join us in the pursuit of musical excellence, where commitment to craft and academic endeavors harmoniously coexist, creating an enriching and vibrant musical tapestry within the VOH community.</p>
            <br>
            <div class="row">
                <div class="col-sm-4">
                    <p class="text-center"><strong>Professor Dr. Mohd Izani Mohd Zain</strong></p><br>
                    <a href="#demo" data-toggle="collapse">
                        <img src="img/tnchepa.png" class="img-circle person circular-image" alt="TNCHEPA" width="255" height="255">
                        <style>
                            .circular-image {
                                max-width: 250px;
                                max-height: 300px;
                            }
                        </style>
                    </a>
                    <div id="demo" class="collapse">
                        <p>Deputy Vice Chancellor</p>
                        <p>Student and Alumni Affairs</p>
                        <p>Universiti Malaysia Terengganu</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <p class="text-center"><strong>En Norhasim Bin Zulkaplee</strong></p><br>
                    <a href="#demo2" data-toggle="collapse">
                        <img src="img/nor.jpeg" class="img-circle person circular-image" alt="Affiq" width="255" height="255">
                    </a>
                    <div id="demo2" class="collapse">
                        <p>En. Norhasim</p>
                        <p>Advisor</p>
                        <p>Voice of Harmony</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <p class="text-center"><strong>Nurul Asyikin Binti Yaacob</strong></p><br>
                    <a href="#demo3" data-toggle="collapse">
                        <img src="img/iman.jpg" class="img-circle person circular-image" alt="Manda" width="255" height="255">
                    </a>
                    <div id="demo3" class="collapse">
                        <p>President</p>
                        <p>2023-2024</p>
                        <p>Voice of Harmony</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Container (TOUR Section) -->
        <div id="tour" class="bg-1">
            <div class="container">
                <h3 class="text-center">BOOK OUR SERVICES!</h3>
                <p class="text-center">We offer variety of services.<br> Remember to check it out!</p>

                <div class="row text-center">
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src="img/studio.jpg" alt="Studio" width="400" height="300">
                            <p><strong>Studio</strong></p>
                            <p>A room where you can explore your talent</p>
                            <p><a class="btn btn-secondary" href="bookStudio.jsp">Book Studio »</a></p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src="img/ins.jpg" alt="Instrument" width="400" height="300">
                            <p><strong>Instrument</strong></p>
                            <p>More instruments provided to students</p>
                            <p><a class="btn btn-secondary" href="bookInstrument.jsp">Book Instrument »</a></p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src="img/mosh.jpg" alt="Performance" width="400" height="300">
                            <p><strong>Performance</strong></p>
                            <p>Let us liven up your event!</p>
                            <p><a class="btn btn-secondary" href="bookPerformance.jsp">Book Performance »</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">



                </div>
            </div>
        </div>
    </div>

    <!-- Container (Contact Section) -->
    <div id="contact" class="container">
        <h3 class="text-center">Contact Us</h3>
        <p class="text-center"><em>Thank You For Your SupportS!</em></p>
        <div class="row">
            <div class="col-6 col-md-4">
                <br>
                <p>For Inquiries,</p>
                <p><span class="glyphicon glyphicon-map-marker"></span> Universiti Malaysia Terengganu</p>
                <p><span class="glyphicon glyphicon-phone"></span> Phone: 011-61699566</p>
                <p><span class="glyphicon glyphicon-envelope"></span> Email: voiceofharmonyumt@gmail.com</p>
            </div>
        </div>
        <br>

    </div>

    <!-- Image of location/map -->
    <img src="map.jpg" class="img-responsive" style="width:100%">

    <!-- Footer -->
    <footer class="text-center">
        <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a><br><br>

    </footer>

    <script>
        $(document).ready(function () {
            // Initialize Tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {

                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 900, function () {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });
        })
    </script>

</body>
</html>