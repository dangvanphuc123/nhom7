<style>
    body{
        background-color: #1a2035;
    }
    
    .page{
        width: 450px;
        height: 350px;
        margin: 150px auto;
        background-color: #fff;
        border-radius: 15px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .box h3{
        font-size: 28px;
        margin-bottom: 30px;
        text-align: center;
    }

    .box td{
        padding-bottom: 10px;
    }

    .box td.tenTruong{
        width: 120px;
    }

    .box td input[type=text], .box td input[type=password]{
        width: 240px;
        padding: 5px;
    }

    .box td a{
        float: right;
        text-decoration: none;
        font-style: italic;
        color: #424242;
    }

    .box td a:hover{
        text-decoration: underline;
    }

    .box td input[type=submit]{
        width: 100px;
        height: 35px;
        border: 1px solid #7b1fa2;
        border-radius: 5px;
        background-color: #fff;
        color: #000;
        margin-left: 15px;
        margin-top: 10px;
    }

    .box td input[type=submit]:hover{
        cursor: pointer;
        background-color: #7b1fa2;
        color: #fff;
    }
</style>

<?php
    if (isset($_POST["login"])){
        $user = $_POST['username'];
        $pass = $_POST['password'];

        $sql = "SELECT * FROM admin_info WHERE admin_email = '$user' and admin_password = '$pass' ";
        $query = mysqli_query($con, $sql);
        $rs = mysqli_num_rows($query);
        $data = mysqli_fetch_array($query);
        if ($rs > 0){
            $_SESSION['userAd'] = $data['admin_name'];
            header("Location: index.php");
        }
        else{
            echo "<script language='javascript' type='text/javascript'>alert('Tên đăng nhập hoặc mật khẩu không đúng');</script>";
        }
    }
?>

<div class="page">
    <div class="box">
        <h3>Đăng Nhập Admin</h3>
        <form action="" method="POST">
            <table>
                <tr>
                    <td class="tenTruong"><label> Tên đăng nhập </label></td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td class="tenTruong"><label> Mật khẩu </label></td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <!-- <td><a href="?thamso=doiMK">Quên mật khẩu ?</a></td> -->
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" name="login" value="Đăng Nhập" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>