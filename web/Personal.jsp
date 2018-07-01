<%--
    Document   : Personal
    Created on : 11-feb-2018, 17:49:52
    Author     : KLAY
--%>

<%@page import="java.util.Date"%>
<%@page import="model.Personal"%>
<%@page import="java.util.List"%>
<%@page import="services.daoImp.PersonalDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Personal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <!-- footerSyle  -->
        <link href="css/sticky-footerOriginal.css" rel="stylesheet">
    </head>

    <body style="background: url('resources/Library-books-009.png')" >
        <%
            HttpSession sessionStatus;
            try {
                sessionStatus = request.getSession();
                //Date lastUse = new Date(sessionStatus.getLastAccessedTime());
                Date timeSinceLastUse = new Date(System.currentTimeMillis() - sessionStatus.getLastAccessedTime());
                System.out.println("Tiempo desde el ultimo acceso" + timeSinceLastUse.getMinutes() + ":" + timeSinceLastUse.getSeconds());
                if (timeSinceLastUse.getMinutes() > 30) {
                    System.out.println("Han pasado mas de 10 min desde el ultimo acceso a la session anterior. Invalida la sesssion");
                    session.invalidate();
                    response.sendRedirect("Login.jsp");
                }
                try {
                    System.out.println(sessionStatus.getAttribute("userRole"));
                    if (!sessionStatus.getAttribute("userRole").equals("admin") && !sessionStatus.getAttribute("userRole").equals("user")) {
                        response.sendRedirect("Login.jsp");
                    }
                } catch (Exception e2) {
                    response.sendRedirect("Login.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("Login.jsp");
            }
        %>
        <!--NAVBAR-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" style=" background: rgba(255, 255, 255, 0.93)">
            <a class="navbar-brand" href="#" >
                <div class="container">
                    <img src="http://www.freepngimg.com/download/book/2-books-png-image.png" width="30" height="30" class="d-inline-block align-top" alt=""/>
                    MyAcademy
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/Hibernate/Inicio.jsp" >
                            INICIO
                        </a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Administración
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Alumnos.jsp">Alumnos</a>
                            <a class="dropdown-item" href="#">Personal</a>
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/GruposyClases.jsp">Grupos y Clases</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Contabilidad
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Ingresos.jsp">Ingresos</a>
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Gastos.jsp">Gastos</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Configuracion
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Perfil.jsp">Perfil</a>
                            <% sessionStatus = request.getSession();
                                if (sessionStatus.getAttribute("userRole").equals("admin")) {
                                    out.print("   <a class='dropdown-item' href='http://localhost:8080/Hibernate/Usuarios.jsp'>Usuarios</a> ");
                                }
                            %>                            <div class="dropdown-divider"></div>
                            <form action="UserController" method="GET">
                                <button class="dropdown-item" type="submit" name="salir">Salir</button>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid " style="margin-top: 60px;">
        <div class="container">
            <div id="accordion">
                <div class="card mb-3 border-0" style="background: rgba(255, 255, 255, 0)">
                    <div class="row">
                        <div class="btn col" id="headingOne">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#crearPersonal"> Nuevo Personal</button>
                        </div>

                    </div>
                    <!-- Modal -->
                    <!--Formulario-->
                    <div class="modal fade bd-example-modal-lg" id="crearPersonal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Nuevo Personal</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <!-- FORM ADDEMPLEADO-->
                                <form class="horizontal-form" action="PersonalController" method="GET">
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <div class="col-sm-2">
                                                <label for="" class="row-sm-2 col-form-label col-form-label-sm">Nombre:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Nombre" name="nombre" required >
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Apellidos:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Apellidos" name="apellidos" required >
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Fecha de nacimiento:</label>
                                                <input type="date" class="form-control form-control-sm" id=""  placeholder="2018-08-19" name="fechnac" required >
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="row-sm-2 col-form-label col-form-label-sm">DNI/FIG:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="12345678a" name="DNIPersonal" required >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm"> Nacionalidad:</label>
                                                <select id="selectbasic" class="form-control form-control-sm" name="nacionalidad" >
                                                    <option value="Afghanistan" title="Afghanistan">Afghanistan</option>
                                                    <option value="Åland Islands" title="Åland Islands">Åland Islands</option>
                                                    <option value="Albania" title="Albania">Albania</option>
                                                    <option value="Algeria" title="Algeria">Algeria</option>
                                                    <option value="American Samoa" title="American Samoa">American Samoa</option>
                                                    <option value="Andorra" title="Andorra">Andorra</option>
                                                    <option value="Angola" title="Angola">Angola</option>
                                                    <option value="Anguilla" title="Anguilla">Anguilla</option>
                                                    <option value="Antarctica" title="Antarctica">Antarctica</option>
                                                    <option value="Antigua and Barbuda" title="Antigua and Barbuda">Antigua and Barbuda</option>
                                                    <option value="Argentina" title="Argentina">Argentina</option>
                                                    <option value="Armenia" title="Armenia">Armenia</option>
                                                    <option value="Aruba" title="Aruba">Aruba</option>
                                                    <option value="Australia" title="Australia">Australia</option>
                                                    <option value="Austria" title="Austria">Austria</option>
                                                    <option value="Azerbaijan" title="Azerbaijan">Azerbaijan</option>
                                                    <option value="Bahamas" title="Bahamas">Bahamas</option>
                                                    <option value="Bahrain" title="Bahrain">Bahrain</option>
                                                    <option value="Bangladesh" title="Bangladesh">Bangladesh</option>
                                                    <option value="Barbados" title="Barbados">Barbados</option>
                                                    <option value="Belarus" title="Belarus">Belarus</option>
                                                    <option value="Belgium" title="Belgium">Belgium</option>
                                                    <option value="Belize" title="Belize">Belize</option>
                                                    <option value="Benin" title="Benin">Benin</option>
                                                    <option value="Bermuda" title="Bermuda">Bermuda</option>
                                                    <option value="Bhutan" title="Bhutan">Bhutan</option>
                                                    <option value="Bolivia, Plurinational State of" title="Bolivia, Plurinational State of">Bolivia, Plurinational State of</option>
                                                    <option value="Bonaire, Sint Eustatius and Saba" title="Bonaire, Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</option>
                                                    <option value="Bosnia and Herzegovina" title="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                    <option value="Botswana" title="Botswana">Botswana</option>
                                                    <option value="Bouvet Island" title="Bouvet Island">Bouvet Island</option>
                                                    <option value="Brazil" title="Brazil">Brazil</option>
                                                    <option value="British Indian Ocean Territory" title="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                                    <option value="Brunei Darussalam" title="Brunei Darussalam">Brunei Darussalam</option>
                                                    <option value="Bulgaria" title="Bulgaria">Bulgaria</option>
                                                    <option value="Burkina Faso" title="Burkina Faso">Burkina Faso</option>
                                                    <option value="Burundi" title="Burundi">Burundi</option>
                                                    <option value="Cambodia" title="Cambodia">Cambodia</option>
                                                    <option value="Cameroon" title="Cameroon">Cameroon</option>
                                                    <option value="Canada" title="Canada">Canada</option>
                                                    <option value="Cape Verde" title="Cape Verde">Cape Verde</option>
                                                    <option value="Cayman Islands" title="Cayman Islands">Cayman Islands</option>
                                                    <option value="Central African Republic" title="Central African Republic">Central African Republic</option>
                                                    <option value="Chad" title="Chad">Chad</option>
                                                    <option value="Chile" title="Chile">Chile</option>
                                                    <option value="China" title="China">China</option>
                                                    <option value="Christmas Island" title="Christmas Island">Christmas Island</option>
                                                    <option value="Cocos (Keeling) Islands" title="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                                    <option value="Colombia" title="Colombia">Colombia</option>
                                                    <option value="Comoros" title="Comoros">Comoros</option>
                                                    <option value="Congo" title="Congo">Congo</option>
                                                    <option value="Congo, the Democratic Republic of the" title="Congo, the Democratic Republic of the">Congo, the Democratic Republic of the</option>
                                                    <option value="Cook Islands" title="Cook Islands">Cook Islands</option>
                                                    <option value="Costa Rica" title="Costa Rica">Costa Rica</option>
                                                    <option value="Côte d'Ivoire" title="Côte d'Ivoire">Côte d'Ivoire</option>
                                                    <option value="Croatia" title="Croatia">Croatia</option>
                                                    <option value="Cuba" title="Cuba">Cuba</option>
                                                    <option value="Curaçao" title="Curaçao">Curaçao</option>
                                                    <option value="Cyprus" title="Cyprus">Cyprus</option>
                                                    <option value="Czech Republic" title="Czech Republic">Czech Republic</option>
                                                    <option value="Denmark" title="Denmark">Denmark</option>
                                                    <option value="Djibouti" title="Djibouti">Djibouti</option>
                                                    <option value="Dominica" title="Dominica">Dominica</option>
                                                    <option value="Dominican Republic" title="Dominican Republic">Dominican Republic</option>
                                                    <option value="Ecuador" title="Ecuador">Ecuador</option>
                                                    <option value="Egypt" title="Egypt">Egypt</option>
                                                    <option value="El Salvador" title="El Salvador">El Salvador</option>
                                                    <option value="Equatorial Guinea" title="Equatorial Guinea">Equatorial Guinea</option>
                                                    <option value="Eritrea" title="Eritrea">Eritrea</option>
                                                    <option value="Estonia" title="Estonia">Estonia</option>
                                                    <option value="Ethiopia" title="Ethiopia">Ethiopia</option>
                                                    <option value="Falkland Islands (Malvinas)" title="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                                    <option value="Faroe Islands" title="Faroe Islands">Faroe Islands</option>
                                                    <option value="Fiji" title="Fiji">Fiji</option>
                                                    <option value="Finland" title="Finland">Finland</option>
                                                    <option value="France" title="France">France</option>
                                                    <option value="French Guiana" title="French Guiana">French Guiana</option>
                                                    <option value="French Polynesia" title="French Polynesia">French Polynesia</option>
                                                    <option value="French Southern Territories" title="French Southern Territories">French Southern Territories</option>
                                                    <option value="Gabon" title="Gabon">Gabon</option>
                                                    <option value="Gambia" title="Gambia">Gambia</option>
                                                    <option value="Georgia" title="Georgia">Georgia</option>
                                                    <option value="Germany" title="Germany">Germany</option>
                                                    <option value="Ghana" title="Ghana">Ghana</option>
                                                    <option value="Gibraltar" title="Gibraltar">Gibraltar</option>
                                                    <option value="Greece" title="Greece">Greece</option>
                                                    <option value="Greenland" title="Greenland">Greenland</option>
                                                    <option value="Grenada" title="Grenada">Grenada</option>
                                                    <option value="Guadeloupe" title="Guadeloupe">Guadeloupe</option>
                                                    <option value="Guam" title="Guam">Guam</option>
                                                    <option value="Guatemala" title="Guatemala">Guatemala</option>
                                                    <option value="Guernsey" title="Guernsey">Guernsey</option>
                                                    <option value="Guinea" title="Guinea">Guinea</option>
                                                    <option value="Guinea-Bissau" title="Guinea-Bissau">Guinea-Bissau</option>
                                                    <option value="Guyana" title="Guyana">Guyana</option>
                                                    <option value="Haiti" title="Haiti">Haiti</option>
                                                    <option value="Heard Island and McDonald Islands" title="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
                                                    <option value="Holy See (Vatican City State)" title="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                                    <option value="Honduras" title="Honduras">Honduras</option>
                                                    <option value="Hong Kong" title="Hong Kong">Hong Kong</option>
                                                    <option value="Hungary" title="Hungary">Hungary</option>
                                                    <option value="Iceland" title="Iceland">Iceland</option>
                                                    <option value="India" title="India">India</option>
                                                    <option value="Indonesia" title="Indonesia">Indonesia</option>
                                                    <option value="Iran, Islamic Republic of" title="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                                    <option value="Iraq" title="Iraq">Iraq</option>
                                                    <option value="Ireland" title="Ireland">Ireland</option>
                                                    <option value="Isle of Man" title="Isle of Man">Isle of Man</option>
                                                    <option value="Israel" title="Israel">Israel</option>
                                                    <option value="Italy" title="Italy">Italy</option>
                                                    <option value="Jamaica" title="Jamaica">Jamaica</option>
                                                    <option value="Japan" title="Japan">Japan</option>
                                                    <option value="Jersey" title="Jersey">Jersey</option>
                                                    <option value="Jordan" title="Jordan">Jordan</option>
                                                    <option value="Kazakhstan" title="Kazakhstan">Kazakhstan</option>
                                                    <option value="Kenya" title="Kenya">Kenya</option>
                                                    <option value="Kiribati" title="Kiribati">Kiribati</option>
                                                    <option value="Korea, Democratic People's Republic of" title="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                                                    <option value="Korea, Republic of" title="Korea, Republic of">Korea, Republic of</option>
                                                    <option value="Kuwait" title="Kuwait">Kuwait</option>
                                                    <option value="Kyrgyzstan" title="Kyrgyzstan">Kyrgyzstan</option>
                                                    <option value="Lao People's Democratic Republic" title="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                                    <option value="Latvia" title="Latvia">Latvia</option>
                                                    <option value="Lebanon" title="Lebanon">Lebanon</option>
                                                    <option value="Lesotho" title="Lesotho">Lesotho</option>
                                                    <option value="Liberia" title="Liberia">Liberia</option>
                                                    <option value="Libya" title="Libya">Libya</option>
                                                    <option value="Liechtenstein" title="Liechtenstein">Liechtenstein</option>
                                                    <option value="Lithuania" title="Lithuania">Lithuania</option>
                                                    <option value="Luxembourg" title="Luxembourg">Luxembourg</option>
                                                    <option value="Macao" title="Macao">Macao</option>
                                                    <option value="Macedonia, the former Yugoslav Republic of" title="Macedonia, the former Yugoslav Republic of">Macedonia, the former Yugoslav Republic of</option>
                                                    <option value="Madagascar" title="Madagascar">Madagascar</option>
                                                    <option value="Malawi" title="Malawi">Malawi</option>
                                                    <option value="Malaysia" title="Malaysia">Malaysia</option>
                                                    <option value="Maldives" title="Maldives">Maldives</option>
                                                    <option value="Mali" title="Mali">Mali</option>
                                                    <option value="Malta" title="Malta">Malta</option>
                                                    <option value="Marshall Islands" title="Marshall Islands">Marshall Islands</option>
                                                    <option value="Martinique" title="Martinique">Martinique</option>
                                                    <option value="Mauritania" title="Mauritania">Mauritania</option>
                                                    <option value="Mauritius" title="Mauritius">Mauritius</option>
                                                    <option value="Mayotte" title="Mayotte">Mayotte</option>
                                                    <option value="Mexico" title="Mexico">Mexico</option>
                                                    <option value="Micronesia, Federated States of" title="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                                    <option value="Moldova, Republic of" title="Moldova, Republic of">Moldova, Republic of</option>
                                                    <option value="Monaco" title="Monaco">Monaco</option>
                                                    <option value="Mongolia" title="Mongolia">Mongolia</option>
                                                    <option value="Montenegro" title="Montenegro">Montenegro</option>
                                                    <option value="Montserrat" title="Montserrat">Montserrat</option>
                                                    <option value="Morocco" title="Morocco">Morocco</option>
                                                    <option value="Mozambique" title="Mozambique">Mozambique</option>
                                                    <option value="Myanmar" title="Myanmar">Myanmar</option>
                                                    <option value="Namibia" title="Namibia">Namibia</option>
                                                    <option value="Nauru" title="Nauru">Nauru</option>
                                                    <option value="Nepal" title="Nepal">Nepal</option>
                                                    <option value="Netherlands" title="Netherlands">Netherlands</option>
                                                    <option value="New Caledonia" title="New Caledonia">New Caledonia</option>
                                                    <option value="New Zealand" title="New Zealand">New Zealand</option>
                                                    <option value="Nicaragua" title="Nicaragua">Nicaragua</option>
                                                    <option value="Niger" title="Niger">Niger</option>
                                                    <option value="Nigeria" title="Nigeria">Nigeria</option>
                                                    <option value="Niue" title="Niue">Niue</option>
                                                    <option value="Norfolk Island" title="Norfolk Island">Norfolk Island</option>
                                                    <option value="Northern Mariana Islands" title="Northern Mariana Islands">Northern Mariana Islands</option>
                                                    <option value="Norway" title="Norway">Norway</option>
                                                    <option value="Oman" title="Oman">Oman</option>
                                                    <option value="Pakistan" title="Pakistan">Pakistan</option>
                                                    <option value="Palau" title="Palau">Palau</option>
                                                    <option value="Palestinian Territory, Occupied" title="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                                    <option value="Panama" title="Panama">Panama</option>
                                                    <option value="Papua New Guinea" title="Papua New Guinea">Papua New Guinea</option>
                                                    <option value="Paraguay" title="Paraguay">Paraguay</option>
                                                    <option value="Peru" title="Peru">Peru</option>
                                                    <option value="Philippines" title="Philippines">Philippines</option>
                                                    <option value="Pitcairn" title="Pitcairn">Pitcairn</option>
                                                    <option value="Poland" title="Poland">Poland</option>
                                                    <option value="Portugal" title="Portugal">Portugal</option>
                                                    <option value="Puerto Rico" title="Puerto Rico">Puerto Rico</option>
                                                    <option value="Qatar" title="Qatar">Qatar</option>
                                                    <option value="Réunion" title="Réunion">Réunion</option>
                                                    <option value="Romania" title="Romania">Romania</option>
                                                    <option value="Russian Federation" title="Russian Federation">Russian Federation</option>
                                                    <option value="Rwanda" title="Rwanda">Rwanda</option>
                                                    <option value="Saint Barthélemy" title="Saint Barthélemy">Saint Barthélemy</option>
                                                    <option value="Saint Helena, Ascension and Tristan da Cunha" title="Saint Helena, Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</option>
                                                    <option value="Saint Kitts and Nevis" title="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                    <option value="Saint Lucia" title="Saint Lucia">Saint Lucia</option>
                                                    <option value="Saint Martin (French part)" title="Saint Martin (French part)">Saint Martin (French part)</option>
                                                    <option value="Saint Pierre and Miquelon" title="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                                    <option value="Saint Vincent and the Grenadines" title="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                                    <option value="Samoa" title="Samoa">Samoa</option>
                                                    <option value="San Marino" title="San Marino">San Marino</option>
                                                    <option value="Sao Tome and Principe" title="Sao Tome and Principe">Sao Tome and Principe</option>
                                                    <option value="Saudi Arabia" title="Saudi Arabia">Saudi Arabia</option>
                                                    <option value="Senegal" title="Senegal">Senegal</option>
                                                    <option value="Serbia" title="Serbia">Serbia</option>
                                                    <option value="Seychelles" title="Seychelles">Seychelles</option>
                                                    <option value="Sierra Leone" title="Sierra Leone">Sierra Leone</option>
                                                    <option value="Singapore" title="Singapore">Singapore</option>
                                                    <option value="Sint Maarten (Dutch part)" title="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</option>
                                                    <option value="Slovakia" title="Slovakia">Slovakia</option>
                                                    <option value="Slovenia" title="Slovenia">Slovenia</option>
                                                    <option value="Solomon Islands" title="Solomon Islands">Solomon Islands</option>
                                                    <option value="Somalia" title="Somalia">Somalia</option>
                                                    <option value="South Africa" title="South Africa">South Africa</option>
                                                    <option value="South Georgia and the South Sandwich Islands" title="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option>
                                                    <option value="South Sudan" title="South Sudan">South Sudan</option>
                                                    <option value="Spain" title="Spain" selected>Spain</option>
                                                    <option value="Sri Lanka" title="Sri Lanka">Sri Lanka</option>
                                                    <option value="Sudan" title="Sudan">Sudan</option>
                                                    <option value="Suriname" title="Suriname">Suriname</option>
                                                    <option value="Svalbard and Jan Mayen" title="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                                    <option value="Swaziland" title="Swaziland">Swaziland</option>
                                                    <option value="Sweden" title="Sweden">Sweden</option>
                                                    <option value="Switzerland" title="Switzerland">Switzerland</option>
                                                    <option value="Syrian Arab Republic" title="Syrian Arab Republic">Syrian Arab Republic</option>
                                                    <option value="Taiwan, Province of China" title="Taiwan, Province of China">Taiwan, Province of China</option>
                                                    <option value="Tajikistan" title="Tajikistan">Tajikistan</option>
                                                    <option value="Tanzania, United Republic of" title="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                                    <option value="Thailand" title="Thailand">Thailand</option>
                                                    <option value="Timor-Leste" title="Timor-Leste">Timor-Leste</option>
                                                    <option value="Togo" title="Togo">Togo</option>
                                                    <option value="Tokelau" title="Tokelau">Tokelau</option>
                                                    <option value="Tonga" title="Tonga">Tonga</option>
                                                    <option value="Trinidad and Tobago" title="Trinidad and Tobago">Trinidad and Tobago</option>
                                                    <option value="Tunisia" title="Tunisia">Tunisia</option>
                                                    <option value="Turkey" title="Turkey">Turkey</option>
                                                    <option value="Turkmenistan" title="Turkmenistan">Turkmenistan</option>
                                                    <option value="Turks and Caicos Islands" title="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                    <option value="Tuvalu" title="Tuvalu">Tuvalu</option>
                                                    <option value="Uganda" title="Uganda">Uganda</option>
                                                    <option value="Ukraine" title="Ukraine">Ukraine</option>
                                                    <option value="United Arab Emirates" title="United Arab Emirates">United Arab Emirates</option>
                                                    <option value="United Kingdom" title="United Kingdom">United Kingdom</option>
                                                    <option value="United States" title="United States">United States</option>
                                                    <option value="United States Minor Outlying Islands" title="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                                    <option value="Uruguay" title="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan" title="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu" title="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela, Bolivarian Republic of" title="Venezuela, Bolivarian Republic of">Venezuela, Bolivarian Republic of</option>
                                                    <option value="Viet Nam" title="Viet Nam">Viet Nam</option>
                                                    <option value="Virgin Islands, British" title="Virgin Islands, British">Virgin Islands, British</option>
                                                    <option value="Virgin Islands, U.S." title="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                                    <option value="Wallis and Futuna" title="Wallis and Futuna">Wallis and Futuna</option>
                                                    <option value="Western Sahara" title="Western Sahara">Western Sahara</option>
                                                    <option value="Yemen" title="Yemen">Yemen</option>
                                                    <option value="Zambia" title="Zambia">Zambia</option>
                                                    <option value="Zimbabwe" title="Zimbabwe">Zimbabwe</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm"> E-mail:</label>
                                                <input type="email" class="form-control form-control-sm" id="" placeholder="email@ejemplo.com" name="email" required >
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm"> Tlf. móvil:</label>
                                                <input type="number" class="form-control form-control-sm" id="" placeholder="9 digitos" name="telefonomovil" required >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-6">
                                                <label for="" class="row-sm-6 col-form-label col-form-label-sm">Dirección:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Nombre de la Calle ,bloque nº 01, 1ºA" name="direccion" required >
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Codigo Postal:</label>
                                                <input type="number" class="form-control form-control-sm" id="" placeholder="41000" name="codpostal" required >
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Telefono fijo:</label>
                                                <input type="number" class="form-control form-control-sm" id="" placeholder="telefono" name="telefonofijo" required >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-3">
                                                <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Tipo de contacto:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Ej:Profesor" name="tipoEmpleado" required >
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm"> Cuenta bancaria:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Max: 24 digitos" name="cuenta" required >
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="row-sm-2 col-form-label col-form-label-sm"> Sueldo:</label>
                                                <div class="input-group ">
                                                    <input type="number" class="form-control form-control-sm" id="" placeholder="0" name="sueldo" required >
                                                    <div class="input-group-addon form-control-sm">€</div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Telefono de contacto:</label>
                                                <input type="number" class="form-control form-control-sm" id="" placeholder="9 digitos" value="9 digitos" name="telefonofamiliar" required >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button class="btn btn-primary" type="submit" name="addPersonal" value="Add">Guardar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--LISTADO DE LOS EMPLEADOS-->
                    <div id="collapseTwo" class="table-responsive collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
                        <input class="form-control" id="myInput" type="text" placeholder="Search.." />
                        <table class="table table-sm table-striped rounded mt-2 p-1" style=" background: rgba(255, 255, 255, 0.90)">
                            <thead>
                                <tr>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                    <th scope="col">DNI</th>
                                    <th scope="col">Tlf.móvil</th>
                                    <th scope="col">Tlf.fijo</th>
                                    <th scope="col">e-mail</th>
                                    <th scope="col">Opciones</th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <%
                                    PersonalDaoImp adi = new PersonalDaoImp();
                                    List personal = adi.listPersonal();
                                    for (int i = 0; i < personal.size(); i++) {
                                        Personal a = (Personal) personal.get(i);
                                %>
                                <tr>
                            <form action="PersonalController" method="POST">
                                <td><%= a.getNombre()%></td>
                                <td><%= a.getApellidos()%></td>
                                <td><%= a.getDnipersonal()%></td>
                                <td><%= a.getTelefonopersonal()%></td>
                                <td><%= a.getTelefonofijo()%></td>
                                <td><%= a.getEmail()%></td>
                                <td>
                                    <select name="DNIPersonal" hidden="true">
                                        <option value="<%= a.getDnipersonal()%>" selected="true" hidden="true"><%= a.getDnipersonal()%></option>
                                    </select>
                                    <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#modalUpdate<%= a.getDnipersonal()%>">
                                        <img src="resources/edit.png" width="30" height="30" alt="edit.png"/>
                                    </a>
                                    <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#delPersonal<%= a.getDnipersonal()%>">
                                        <img src="resources/delete.png" width="30" height="30" alt="delete.png"/>
                                    </a>
                                </td>
                                <!-- MODAL PARA EL ELIMINAR-->
                                <div class="modal fade bd-example-modal-lg" id="delPersonal<%= a.getDnipersonal()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro de que desea eliminar a "<%= a.getNombre()%>"?</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-sm-6">
                                                        <label  class="row-sm-6 col-form-label col-form-label-sm">DNI del personal que desea eliminar:</label>
                                                        <input type="text" class="form-control form-control-sm" value="<%= a.getDnipersonal()%>" name="deldni" readonly="true">
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label  class="row-sm-6 col-form-label col-form-label-sm">Apellidos del personal al que va a eliminar:</label>
                                                        <input type="text" class="form-control form-control-sm" value="<%= a.getApellidos()%>" name="delape" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button class="btn btn-danger" type="submit" name="deletePersonal">Eliminar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal para el Update-->
                                <div class="modal fade bd-example-modal-lg" id="modalUpdate<%= a.getDnipersonal()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Nueva Matricula</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-sm-2">
                                                        <label for="" class="row-sm-2 col-form-label col-form-label-sm">Nombre:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getNombre()%>" placeholder="Nombre" name="unombre" required>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm">Apellidos:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getApellidos()%>" placeholder="Apellidos" name="uapellidos" required>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm">Fecha de nacimiento:</label>
                                                        <input type="string" class="form-control form-control-sm" id="" value="<%= a.getFechnac()%>"  placeholder="2018-08-19" name="ufechnac" required>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <label for="" class="row-sm-2 col-form-label col-form-label-sm">DNI/FIG:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getDnipersonal()%>" placeholder="12345678a" name="uDNIPersonal" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm"> Nacionalidad:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getNacionalidad()%>" placeholder="Spain" name="unacionalidad" required>

                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm"> E-mail:</label>
                                                        <input type="email" class="form-control form-control-sm" id="" value="<%= a.getEmail()%>" placeholder="email@ejemplo.com" name="uemail" required>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm"> Tlf. móvil:</label>
                                                        <input type="number" class="form-control form-control-sm" id="" value="<%= a.getTelefonopersonal()%>" placeholder="9 digitos" name="utelefonomovil" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-6">
                                                        <label for="" class="row-sm-6 col-form-label col-form-label-sm">Dirección:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getDireccion()%>" placeholder="Nombre de la Calle ,bloque nº 01, 1ºA" name="udireccion" required>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Codigo Postal:</label>
                                                        <input type="number" class="form-control form-control-sm" id="" value="<%= a.getCodpostal()%>" placeholder="41000" name="ucodpostal" required>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Telefono fijo:</label>
                                                        <input type="number" class="form-control form-control-sm" id="" value="<%= a.getTelefonofijo()%>" placeholder="telefono" name="utelefonofijo" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3">
                                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Tipo de contacto:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getTipo()%>" placeholder="Ej:Profesor"  name="utipoEmpleado" required>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Cuenta bancaria:</label>
                                                        <input type="text" class="form-control form-control-sm" id="" value="<%= a.getCuentabancaria()%>" placeholder="Max: 24 digitos" name="ucuenta" required>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Telefono de contacto:</label>
                                                        <input type="number" class="form-control form-control-sm" id="" value="<%= a.getTelefonofamiliar()%>" placeholder="9 digitos" name="utelefonofamiliar" required>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm"> Sueldo:</label>
                                                        <input type="number" class="form-control form-control-sm" id="" placeholder="Sueldo" value="<%= a.getSueldo()%>" name="usueldo" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button class="btn btn-primary" type="submit" name="updatePersonal" >Guardar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>
