<?php
$return["data"] = array();

  $db = "db_restapi";
  $host = "192.168.100.240:6607";
  $db_user = 'xxx';
  $db_password = 'xxx';
  $link = mysqli_connect($host, $db_user, $db_password, $db);

  if(isset($_REQUEST["auth"]))
  {
    $authkey = $_REQUEST["auth"];
    if($authkey == "kjgdkhdfldfguttedfgr")
    {
        $json["data"] = array();
        $sql = "SELECT * FROM t_students";
        $res = mysqli_query($link, $sql);
        $numrows = mysqli_num_rows($res);
        while($array = mysqli_fetch_assoc($res))
        {
          array_push($return["data"], $array);
        }
        mysqli_close($link);
        header('Content-Type: application/json');
    }
        else
        {
        $return["error"] = true;
        $return["msg"] = "Authentication error.";
        }
    }
    else{
        $return["error"]  = true;
        $return["msg"] = "Send auth key.";
        }
    header('Content-Type: application/json');
    echo json_encode($return);
    ?>
    
