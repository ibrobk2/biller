<?php

if(isset($_POST['verify'])){
$token = "";


// $meter_no = "30530288148";
// $meter_type = "prepaid";
$meter_no = $_POST['meter_no'];
$meter_type = $_POST['meter_type'];
$base_url = "https://n3tdata.com/api/bill/bill-validation?meter_number=".$meter_no."&disco=3&meter_type=$meter_type";

    // create a new cURL resource
    $ch = curl_init();

    // set URL and other appropriate options
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($ch, CURLOPT_URL, $base_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // grab URL and pass it to the browser
    $response = curl_exec($ch);

    // close cURL resource, and free up system resources
    curl_close($ch);

    // decode the response
    $response_data = json_decode($response, true);

    $result = $response_data['name'];

    // print the name
   echo "<script> alert('Customer Name: $result');</script>";
//    echo "<script> alert('Customer Name: '".$result."');</script>";

}


if(isset($_POST['btn_buy'])){
// Checking user balance before transaction
$user = $_SESSION['user'];
$sql = "SELECT * FROM users WHERE username='$user'";
$res = mysqli_query($conn, $sql);

$row = mysqli_fetch_assoc($res);
$wallet = $row['balance'];


    $url = 'https://n3tdata.com/api/bill';
    $meter_no = $_POST['meter_no'];
    $meter_type = $_POST['meter_type'];
    $amount = $_POST['amount'];
    if($amount>$wallet){
        echo "<script>
            alert('Sorry, Insufficient Balance, Pls Fund Your Wallet');
    
            window.location = 'index.php';
        </script>";
       
    }

    $bypass = false;
    $request_id = uniqid("HUKPOLY-");
    // $phone = $_POST['phone'];
//verify user amount before transaction

    $paypload = array(
        'disco' => 3,
         'meter_type' => $meter_type,
         'meter_number' => $meter_no,
         'amount' => $amount,
         'bypass' => false,
         'request-id' => $request_id);

         $ch = curl_init();
         curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
         curl_setopt($ch, CURLOPT_URL, $url);
         curl_setopt($ch, CURLOPT_POST, 1);
         curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($paypload));
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
         $headers = [
              "Authorization: Token $token",
             'Content-Type: application/json'
         ];
         curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
         $response = curl_exec($ch);
         curl_close($ch);
         
         
         // decode the response
         echo $response_data = json_decode($response, true);
         if($response_data['status']=='success'){
            $_SESSION['token'] = $response_data;
            header("Location: token.php");
         }else{
            $status = $response_data['message'];
            echo "<script>
                alert('There is an Error! $status');
                window.location = 'index.php';
                
            </script>";
         }
        //  $message = $response_data['message'];

        //  echo substr($message, 0, 44);
    
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kedco Bill Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<style>
    body{
        background-image: linear-gradient(45deg, #fff, dodgerblue);
        width: 100%;
        height: 100vh;
    }
    .container{
        width: 50%;
    }
    footer{
        position: absolute;
        bottom: 10px;
    }
</style>
</head>
<body>
    <a href="../user_dashboard.php">Back to User Dashboard</a>
    <br><br><br>
    <div class="container">
        <h2 class="text-center text-white bg-dark p-3">Buy Meter Token</h2>
        <form action="index.php" method="post">
        <div class="form-group">
            <label for="meter_type">Meter Type</label><br>
            <!-- <input type="text" class="form-control" placeholder="Enter Meter Number"> -->
            <select name="meter_type" id="" class="form-control">
                <option value="">Select Option </option>
                <option value="prepaid">Prepaid</option>
                <option value="postpaid">Pospaid</option>
            </select><br>
        </div>
        <div class="form-group">
            <label for="meter_no">Meter Number</label><br>
            <input type="text" class="form-control" placeholder="Enter Meter Number" name="meter_no">
            <button class="form-control btn btn-primary btn-sm" name="verify">Verify Account</button><br><br>
        </div>
        <div class="form-group">
            <label for="amount">Amount</label><br>
            <input type="text" class="form-control" placeholder="Enter Amount" name="amount"><br>
        </div>
        <div class="form-group">
            <label for="email">Email Address</label><br>
            <input type="text" class="form-control" placeholder="Enter Email" name="email"><br>
        </div>

        <button class="form-control btn btn-success" name="btn_buy">Purchase</button>
    </div>
    </form>

    <footer>
        <p>Copyright &copy; Department of Computer Science, HUKPOLY Katsina.</p>
    </footer>
</body>
</html>