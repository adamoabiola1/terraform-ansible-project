#index.php
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div id="wrapper">
        <h1 id="pageTitle">Adamo Abiola AWS Server Information</h1>
        <div class="twoColRow">
            <div class="serverStats">
                <img src="./assets/server.png" alt="" class="icon">
                <h2 class="statsValue">
                    <?php $serverName = gethostname();
                    echo "$serverName"; ?>
                </h2>
            </div>
         <div class="serverStats">
                <img src="./assets/clock.png" alt="" class="icon">
                <h2 class="statsValue">

                    <?php
                    date_default_timezone_set('Africa/Lagos');
                    echo date("F d, Y h:i:s A e", time());
                    ?>
                    <!--
                    <?php $serverTime = date_default_timezone_get();
                    echo "$serverTime"; ?>
                    -->
                </h2>
            </div>
             <div>
        <p id="copyright">&copy; <?php echo date("Y"); ?> &bull; All Rights Reserved.</p>
      </div>

</body>
</html>
