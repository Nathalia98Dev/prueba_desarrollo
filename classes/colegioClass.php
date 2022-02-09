<?php
ini_set('display_errors',1);
error_reporting(E_ALL);
// error_reporting(0);

// include("db_class.php");
 
$jsonData = json_decode(pg_escape_string(file_get_contents('php://input')));
$option = $jsonData->option;
if (isset($jsonData->data)) {
    $data = $jsonData->data;
}
$empCls = new Colegio();

switch ($option) {
    case 'getAsignatureByTeacher':
        $empCls->getAsignatureByTeacher();
        break;
    default:
        return;
}


class Colegio{

    public function __construct() {
        global $db;
        $this->db = $db;
    }

    function getAsignatureByTeacher() {
        global $db, $id, $data;

        $id = $data->idTeacher;
        
        $sql = "SELECT a.nombre
                FROM asignaturas a
                    LEFT JOIN profesores p on a.teach_number = p.teach_number
                WHERE p.teach_number = $id";

        // echo $sql;

        $conn = pg_pconnect("host=localhost dbname=colegio_del_olimpo user=postgres password=postgres");
        $result = pg_query($conn, $sql);
        $arrResult = array();
        $count = 0;

        while ($row = pg_fetch_row($result)) {
            $arrResult[$count] = $row;
            // print_r($row);
            $count += 1;
        }
        // print_r(json_encode($arrResult));

        return json_encode($arrResult);
    }

    function getStudentsByAsignature($id) {
        $sql = "SELECT e.nombre
                FROM estudiantes e
                        LEFT JOIN horarios h on e.id = h.id_estudiante
                        LEFT JOIN asignaturas a on h.id_asignatura = a.id
                WHERE a.id = $id
                GROUP BY e.nombre";

        $result = pg_query($sql);

        return $result;
    }
}
?>