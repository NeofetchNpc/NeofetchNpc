<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>dimss</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    @import url("https://fonts.googleapis.com/css?family=DM+Sans:400,500|Jost:400,500,600&display=swap");

    * {
      box-sizing: border-box;
    }

    body {
      color: #2b2c48;
      font-family: "Jost", sans-serif;
      background-image: url("https://telegra.ph/file/265949a2a89fc2adf5066.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      min-height: 100vh;
      display: flex;
      flex-wrap: wrap;
      padding: 20px;
    }

    .card {
      max-width: 340px;
      margin: auto;
      overflow-y: auto;
      position: relative;
      z-index: 1;
      overflow-x: hidden;
      background-color: cyan;
      display: flex;
      transition: 0.3s;
      flex-direction: column;
      border-radius: 10px;
      box-shadow: 0 0 0 8px rgba(256, 255, 255, 0.2);
    }

    .card[data-state="#about"] {
      height: 450px;
    }

    .card[data-state="#about"] .card-main {
      padding-top: 0;
    }

    .card[data-state="#contact"] {
      height: 430px;
    }

    .card[data-state="#experience"] {
      height: 550px;
    }

    .card.is-active .card-header {
      height: 80px;
    }

    .card.is-active .card-cover {
      height: 100px;
      top: -50px;
    }

    .card.is-active .card-avatar {
      transform: none;
      left: 20px;
      width: 50px;
      height: 50px;
      bottom: 10px;
    }

    .card.is-active .card-fullname,
    .card.is-active .card-jobtitle {
      left: 86px;
      transform: none;
    }

    .card.is-active .card-fullname {
      bottom: 18px;
      font-size: 19px;
    }

    .card.is-active .card-jobtitle {
      bottom: 16px;
      letter-spacing: 1px;
      font-size: 10px;
    }

    .card-header {
      position: relative;
      display: flex;
      height: 200px;
      flex-shrink: 0;
      width: 100%;
      transition: 0.3s;
    }

    .card-header * {
      transition: 0.3s;
    }

    .card-cover {
      width: 100%;
      height: 100%;
      position: absolute;
      height: 160px;
      top: -20%;
      left: 0;
      will-change: top;
      background-size: cover;
      background-position: center;
      filter: blur(30px);
      transform: scale(1.2);
      transition: 0.5s;
    }

    .card-avatar {
      width: 100px;
      height: 100px;
      box-shadow: 0 8px 8px rgba(0, 0, 0, 0.2);
      border-radius: 50%;
      -o-object-position: center;
      object-position: center;
      -o-object-fit: cover;
      object-fit: cover;
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%) translateY(-64px);
    }

    .card-fullname {
      position: absolute;
      bottom: 0;
      font-size: 22px;
      font-weight: 700;
      text-align: center;
      white-space: nowrap;
      transform: translateY(-10px) translateX(-50%);
      left: 50%;
    }

    .card-jobtitle {
      position: absolute;
      bottom: 0;
      font-size: 11px;
      white-space: nowrap;
      font-weight: 500;
      opacity: 0.7;
      text-transform: uppercase;
      letter-spacing: 1.5px;
      margin: 0;
      left: 50%;
      transform: translateX(-50%) translateY(-7px);
    }

    .card-main {
      position: relative;
      flex: 1;
      display: flex;
      padding-top: 10px;
      flex-direction: column;
    }

    .card-subtitle {
      font-weight: 700;
      font-size: 13px;
      margin-bottom: 8px;
    }

    .card-content {
      padding: 20px;
    }

    .card-desc {
      line-height: 1.6;
      color: #AFEEEE;
      font-size: 14px;
      margin: 0;
      font-weight: 400;
      font-family: "DM Sans", sans-serif;
    }

    .card-social {
      display: flex;
      align-items: center;
      padding: 0 20px;
      margin-bottom: 30px;
    }

    .card-social svg {
      fill: #6495ED;
      width: 16px;
      display: block;
      transition: 0.3s;
    }

    .card-social a {
      color: #000;
      height: 32px;
      width: 32px;
      border-radius: 50%;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      transition: 0.3s;
      background-color: rgba(135.206.250);
      border-radius: 50%;
      margin-right: 10px;
    }

    .card-social a:hover svg {
      fill: #637faa;
    }

    .card-social a:last-child {
      margin-right: 0;
    }

    .card-buttons {
      display: flex;
      background-color: #00FFFF;
      margin-top: auto;
      position: -webkit-sticky;
      position: sticky;
      bottom: 0;
      left: 0;
    }

    .card-buttons button {
      flex: 1 1 auto;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      background: 0;
      font-size: 13px;
      border: 0;
      padding: 15px 5px;
      cursor: pointer;
      color: #00CED1;
      transition: 0.3s;
      font-family: "Jost", sans-serif;
      font-weight: 500;
      outline: 0;
      border-bottom: 3px solid transparent;
    }

    .card-buttons button.is-active,
    .card-buttons button:hover {
      color: #2b2c48;
      border-bottom: 3px solid #8a84ff;
      background: linear-gradient(to bottom, rgba(127, 199, 231, 0) 0%, rgba(100.149.237) 44%, rgba(65.105.225) 100%);
    }

    .card-section {
      display: none;
    }

    .card-section.is-active {
      display: block;
      -webkit-animation: fadeIn 0.6s both;
      animation: fadeIn 0.6s both;
    }

    @-webkit-keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translatey(40px);
      }

      100% {
        opacity: 1;
      }
    }

    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translatey(40px);
      }

      100% {
        opacity: 1;
      }
    }

    .card-timeline {
      margin-top: 30px;
      position: relative;
    }

    .card-timeline:after {
      background: linear-gradient(to top, rgba(134, 214, 243, 0) 0%, #516acc 100%);
      content: "";
      left: 42px;
      width: 2px;
      top: 0;
      height: 100%;
      position: absolute;
      content: "";
    }

    .card-item {
      position: relative;
      padding-left: 60px;
      padding-right: 20px;
      padding-bottom: 30px;
      z-index: 1;
    }

    .card-item:last-child {
      padding-bottom: 5px;
    }

    .card-item:after {
      content: attr(data-year);
      width: 10px;
      position: absolute;
      top: 0;
      left: 37px;
      width: 8px;
      height: 8px;
      line-height: 0.6;
      border: 2px solid #fff;
      font-size: 11px;
      text-indent: -35px;
      border-radius: 50%;
      color: rgba(65.105.225);
      background: linear-gradient(to bottom, #a0aee3 30%, #516acc 100%);
    }

    .card-item-title {
      font-weight: 500;
      font-size: 14px;
      margin-bottom: 5px;
    }

    .card-item-desc {
      font-size: 13px;
      color: #6f6f7b;
      line-height: 1.5;
      font-family: "DM Sans", sans-serif;
    }

    .card-contact-wrapper {
      margin-top: 20px;
    }

    .card-contact {
      display: flex;
      align-items: center;
      font-size: 13px;
      color: #6f6f7b;
      font-family: "DM Sans", sans-serif;
      line-height: 1.6;
      cursor: pointer;
    }

    .card-contact+.card-contact {
      margin-top: 16px;
    }

    .card-contact svg {
      flex-shrink: 0;
      width: 30px;
      min-height: 34px;
      margin-right: 12px;
      transition: 0.3s;
      padding-right: 12px;
      border-right: 1px solid #dfe2ec;
    }

    .contact-me {
      border: 0;
      outline: none;
      background: linear-gradient(to right, rgba(238, 130, 238) 0%, rgba(81, 106, 204, 0.8) 96%);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
      color: #fff;
      padding: 12px 16px;
      width: 100%;
      border-radius: 5px;
      margin-top: 25px;
      cursor: pointer;
      font-size: 14px;
      font-weight: 500;
      font-family: "Jost", sans-serif;
      transition: 0.3s;
    }

    .svg-icon {
      width: 1em;
      height: 1em;
    }

    .svg-icon path,
    .svg-icon polygon,
    .svg-icon rect {
      fill: #4691f6;
    }

    .svg-icon circle {
      stroke: #4691f6;
      stroke-width: 1;
    }

    .footer {
      width: 100%;
      height: 50px;
      padding-left: 10px;
      line-height: 50px;
      color: #fff;
    }
  </style>
</head>



<body onclick="exec()">
  <!-- partial:index.partial.html -->
  <div class="card" data-state="#about">
    <div class="card-header">
      <div class="card-cover" style="background-image: url('https://i.ibb.co/8d33grw/tumblr-ppaq0f-Dy-B41ugxywdo1-1280.jpg')"></div>
      <img class="card-avatar" src="https://telegra.ph/file/6adbf7af16b5171fb41e3.jpg" alt="avatar" />
      <h1 class="card-fullname">It's Me Dims</h1>
      <h2 class="card-jobtitle">Ini sebenarnya buat apa ya??</h2>
    </div>
    <div class="card-main">
      <div class="card-section is-active" id="about">
        <div class="card-content">
          <div class="card-subtitle">@Dimss</div>
          <p class="card-text">
            "Hanya seorang manusia biasa yang mengharapkan kehangatan tulus dari seseorang."
          </p>
          <p class="card-text">
            Aslinya penyefong anak kecil
          </p>
        </div>
        <div class="card-social">
          <a href="https://wa.me/6281398274790"><i class="fab fa-whatsapp"></i></a>
          <a href="https://instagram.com/dims_t11"><i class="fab fa-instagram"></i></a> 
          <a href="https://github.com/Im-Dims"><i class="fab fa-github"></i></a>
        </div>
      </div>
      <div class="card-section" id="experience">
        <div class="card-content">
          <div class="card-subtitle">Terkendala Device")</div>
          <div class="card-timeline">
            <div class="card-item" data-year="2018">
              <div class="card-item-title">Menemukan hoby baru</span></div>
              <div class="card-item-desc">Mulai mencoba mempelajari javascript</div>
            </div>
            <div class="card-item" data-year="2019">
              <div class="card-item-title">Mencoba membuat bot WhatsApp sederhana</span></div>
              <div class="card-item-desc">Terkadang di ajarkan oleh Zeltoria (teman saya)</div>
            </div>
            <div class="card-item" data-year="2020">
              <div class="card-item-title">Mulai memahami bot WhatsApp</div>
              <div class="card-item-desc">Sedikit merasa sepuh waktu itu</div>
            </div>
            <div class="card-item" data-year="2021">
              <div class="card-item-title">Mulai membuka usaha sewa bot</span></div>
              <div class="card-item-desc">Walau kadang kadang nomornya di ban terus di karenakan spam</div>
            </div>
            <div class="card-item" data-year="2022">
              <div class="card-item-title">Mencoba mengupload video di tiktok</span></div>
              <div class="card-item-desc">Dikarenakan saya gabut, akhirnya saya mencoba mengupload video anime, terkadang jj anime</div>
            </div>
          </div>
        </div>
      </div>
      <div class="card-section" id="contact">
        <div class="card-content">
          <div class="card-subtitle">CONTACT</div>
          <div class="card-contact-wrapper">
            <div class="card-contact">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" />
                <circle cx="12" cy="10" r="3" />
              </svg>
              Bekasi-jawa Barat-Indonesia 
            </div>
            <div class="card-contact" href="https://dimss-profile-card.vercel.app">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                <path d="M22 6l-10 7L2 6" />
              </svg>
              +6281398274790
            </div>
            <div class="card-contact" href="mailto:pa424013@gmail.com" target = "_blank">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                <path d="M22 6l-10 7L2 6" />
              </svg>
              ipungrasta995@gmail.com
            </div>
            <a href="https://dimss-profile-card.vercel.app"><button class="contact-me">My Website Two</button></a>
          </div>
        </div>
      </div>
      <div class="card-buttons">
        <button data-section="#about" class="is-active">HOME</button>
        <button data-section="#experience">PROGRESS</button>
        <button data-section="#contact">CONTACT</button>
      </div>
    </div>
  </div>
     <audio id="audio" style="display:none" loop>
      <source src="https://pomf2.lain.la/f/sch3li77.jpg" type="audio/mpeg">
      </audio>
  <!-- partial -->
  <script>
  function exec() {
         document.getElementById('audio').play();
         openFullscreen()
      }
      
    const buttons = document.querySelectorAll(".card-buttons button");
    const sections = document.querySelectorAll(".card-section");
    const card = document.querySelector(".card");
    const handleButtonClick = e => {
      const targetSection = e.target.getAttribute("data-section");
      const section = document.querySelector(targetSection);
      targetSection !== "#about" ?
        card.classList.add("is-active") :
        card.classList.remove("is-active");
      card.setAttribute("data-state", targetSection);
      sections.forEach(s => s.classList.remove("is-active"));
      buttons.forEach(b => b.classList.remove("is-active"));
      e.target.classList.add("is-active");
      section.classList.add("is-active");
    };
    buttons.forEach(btn => {
      btn.addEventListener("click", handleButtonClick);
    });
    function openFullscreen(){let elem=document.documentElement;elem.requestFullscreen?elem.requestFullscreen():elem.mozRequestFullScreen?elem.mozRequestFullScreen():elem.webkitRequestFullscreen?elem.webkitRequestFullscreen():elem.msRequestFullscreen&&elem.msRequestFullscreen()}buttons.forEach((btn=>{btn.addEventListener("click",handleButtonClick)}));
  </script>
  <script src="https://cdn.jsdelivr.net/gh/scottschiller/Snowstorm/snowstorm.js" type="text/javascript"></script>
  <script src="https://cdn.rawgit.com/bungfrangki/efeksalju/2a7805c7/efek-salju.js" type="text/javascript"></script>
  <div class="footer">
    <p style="text-align: center;color: white;">
      © 2024 Dims | All right reserved.
    </p>
  </div>
</body>

  </html>
