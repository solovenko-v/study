<?php
    
    function AddEngine($vehicle, $has)
    {
        $vehicle['engine'] = $has;
        return $vehicle;
    }

    function AddWheels($vehicle, $count)
    {
        $vehicle['wheels'] = $count;
        return $vehicle;
    }
   
    function WhatIsIt($vehicle)
    {
        switch ($vehicle['engine']) {
            case true:
                switch ($vehicle['wheels']) {
                    case 2: 
                        return 'motorcycle';
                        break;
                    case 4: 
                        return 'car';
                        break;
                    default:
                        return 'unknown';
                        break;
                }
            case false:
                switch ($vehicle['wheels']) {
                    case 1: 
                        return 'monocycle';
                        break;
                    case 2: 
                        return 'bicycle';
                        break;
                    default:
                        return 'unknown';
                        break;
                }
                default:
                    return 'unknown';
                    break;
        }
    }

    $vehicle = array('engine'=>false, 'wheels'=>0);
    $vehicle = AddEngine($vehicle, true);
    $vehicle = AddWheels($vehicle, 2);
    echo WhatIsIt($vehicle);
    echo '</br>';

    $vehicle = array('engine'=>false, 'wheels'=>0);
    $vehicle = AddEngine($vehicle, false);
    $vehicle = AddWheels($vehicle, 1);
    echo WhatIsIt($vehicle);
    echo '</br>';

 ?> 