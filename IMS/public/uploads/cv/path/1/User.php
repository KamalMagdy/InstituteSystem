<?php

$conn;

/**
 * @method User setUsername(String $username) Description: This set username property
 * @method User getUsername() Description: This get username value
 */
class User extends BaseEntity
{
    public $id;
    public $username;
    public $name;
    public $password;
    public $phone;
    public $email;
    public $photo;
    public $createdAt;
    
    public $conn;
    public $key;

    public function __construct($conn, $userId = false)
    {
        $this->conn = $conn;
        if($userId)
        {
            $query = "SELECT * FROM user WHERE id={$userId}";
            $result = $this->conn->query($query);
            if($result->num_rows > 0)
            {
                // output data of each row
                $row = $result->fetch_assoc();
                foreach($row as $key => $value)
                {
                    $this->$key = $value;
                }
                $this->createdAt = $row['created_at'];
                unset($this->created_at);
            }
            else
            {
                die('User Not Found');
            }
        }
    }

    /**
     * save for new user to database
     */
    public function save()
    {
        $time = date("Y-m-d H:i:s");
        $query = "INSERT INTO `user` (`id`, `name`, `username`, `photo`, `email`, `password`, `phone`, `created_at`) "
                . "VALUES (NULL, '{$this->getName()}', '{$this->getUsername()}', '{$this->getPhoto()}', '{$this->getEmail()}', '{$this->getPassword()}', '{$this->getPhone()}', '{$time}');";

        mysqli_query($this->conn, $query) or die(mysqli_error($this->conn));
        $this->id = mysqli_insert_id($this->conn);
        return $this->id;
    }

    public function update()
    {
        $query = "UPDATE `user` SET `phone` = '{$this->getPhone()}',`name` = '{$this->getName()}',`email` = '{$this->getEmail()}',`username` = '{$this->getUsername()}' WHERE `user`.`id` = {$this->id}";
        mysqli_query($this->conn, $query) or die(mysqli_error($this->conn));
    }

    public function delete()
    {
        $query = "DELETE FROM `user` WHERE `user`.`id` = {$this->id}";
        mysqli_query($this->conn, $query) or die(mysqli_error($this->conn));
    }

}
