console.log("Hello, Here I Am.");

$(document).ready(function() {
	// Produce grid on load
	populateGrid(16);
	
	// Paint pixels on mouseover
	$(document).on('mouseover', '.pixel', function () {
        $(this).addClass('paint');
        console.log("Painting!");
    });

    $(document).on('click', '.reset', function () {
    	var newgrid = prompt("Grid size? Less than 128, please.", 16);
    	$('.pixel').remove();
    	populateGrid(newgrid);
    });
});

function populateGrid(gridsize) 
{
	var pixelsize = (1/gridsize)*100;
	console.log(pixelsize);

	for(var i = 0; i < gridsize; i++)
	{
		for(var j = 0; j < gridsize; j++)
		{
			$('.sketch-grid').append(
				'<div class="pixel" style="width: '
				+pixelsize+'%; height: '+pixelsize+'%"></div>'
			);
		}
	}
}