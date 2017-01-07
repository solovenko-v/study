<h1>Портфолио</h1>
<p>
<table>
Все проекты в следующей таблице являются вымышленными, поэтому даже не пытайтесь перейти по приведенным ссылкам.
<tr><td>Год</td><td>Проект</td><td>Описание</td></tr>
<?php

	foreach($data as $row)
	{
		echo '<tr><td>'.$row['Year'].'</td><td>'.$row['Site'].'</td><td>'.$row['Description'].'</td></tr>';
	}
	
?>
</table>
<div>
<ul>
<?php
	for($i = 1; $i <= $maxpage; $i++)
	{
		if ($i <> $page) {
			echo "<li class = 'passive'> <a class='invarseColor' href = 'http://solovenko.lamp.spsu.ru/portfolio/index/$i'>$i</a> </li>";
		} else {
			echo "<li class='passive'> <a class='invarseColor active2'>$i</a> </li>";
		}		
	}	
?>
</ul>
</div>
</p>