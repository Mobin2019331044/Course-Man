<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sidebar 09</title>
  <style>
    body {
      margin: 0;
      padding: 0;
    }

    .wrapper {
      display: flex;
    }

    #sidebar {
      width: 200px;
      background-color: #f1f1f1;
    }

    #content {
      flex-grow: 1;
      padding: 20px;
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <nav id="sidebar">
      <ul>
        <li class="active">
          <a href="#" style="color: red"><span class="fa fa-home mr-3"></span> Home</a>
        </li>
        <li onclick="displayContent('content1')">
          <a href="#"><span class="fa fa-download mr-3 notif"><small class="d-flex align-items-center justify-content-center">5</small></span> Download</a>
        </li>
        <li onclick="displayContent('content2')">
          <a href="#"><span class="fa fa-gift mr-3"></span> Gift Code</a>
        </li>
        <li onclick="displayContent('content3')">
          <a href="#"><span class="fa fa-trophy mr-3"></span> Top Review</a>
        </li>
        <li>
          <a href="#"><span class="fa fa-cog mr-3"></span> Settings</a>
        </li>
        <li>
          <a href="#"><span class="fa fa-support mr-3"></span> Support</a>
        </li>
        <li>
          <a href="section3"><span class="fa fa-sign-out mr-3"></span> Sign Out</a>
        </li>
      </ul>
    </nav>
    <div id="content">
      <div class="content" id="content1" style="display: none;">
        <h2>Content 1</h2>
        <p>This is the content for item 1.</p>
      </div>
      <div class="content" id="content2" style="display: none;">
        <h2>Content 2</h2>
        <p>This is the content for item 2.</p>
      </div>
      <div class="content" id="content3" style="display: none;">
        <h2>Content 3</h2>
        <p>This is the content for item 3.</p>
      </div>
    </div>
  </div>

  <script>
    function displayContent(contentId) {
      var contents = document.getElementsByClassName("content");
      for (var i = 0; i < contents.length; i++) {
        contents[i].style.display = "none";
      }

      var content = document.getElementById(contentId);
      if (content) {
        content.style.display = "block";
      }
    }
  </script>
</body>
</html>
