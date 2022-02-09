<?php

ini_set('memory_limit', '10000M');

class BDConexion {
    var $db;
    function conect()
    {
        try {
            $this->db = new PDO('pgsql:host=localhost;dbname=colegio_del_olimpo', 'postgres', 'postgres');
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    function commit()
    {
        //$db->exec("COMMIT");	
        $this->db->commit();
        return $this->db->lastInsertId();
    }

    function executeQuery($dato) {
        if($this->db){
            $this->db->beginTransaction();
            $result = $this->db->query($dato);
            $arrResult = array();
            $count = 0;
    
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                $arrResult[$count] = $row;
                //print_r($row);
                $count += 1;
            }
    
            return $arrResult;
        }
    }
}
