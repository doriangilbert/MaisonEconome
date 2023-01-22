<html>
    <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {
                'packages': ['corechart']
            });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                <?php
                include('models/connexion.php');
                $sql = "SELECT COUNT(*) AS nbHomme FROM utilisateur WHERE userGender = 0";
                $result = mysqli_query($bdd, $sql);
                while ($row = mysqli_fetch_assoc($result)) {
                    $nbHomme = $row['nbHomme'];
                }
                $sql = "SELECT COUNT(*) AS nbFemme FROM utilisateur WHERE userGender = 1";
                $result = mysqli_query($bdd, $sql);
                while ($row = mysqli_fetch_assoc($result)) {
                    $nbFemme = $row['nbFemme'];
                }
                ?>

                var data = google.visualization.arrayToDataTable([
                    ["Genre", "Effectif", {role: "style"}],
                    ["Hommes", <?php echo $nbHomme ?>, "color: #0000FF"],
                    ["Femmes", <?php echo $nbFemme ?>, "color: #FF0000"]
                ]);

                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {
                        calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"
                    }, 2]);

                var options = {
                    title: "Nombre d'utilisateurs par genre",
                    width: 800,
                    height: 600,
                    bar: {groupWidth: "95%"},
                    legend: {position: "none"},
                };
                var chart = new google.visualization.BarChart(document.getElementById("graphique"));
                chart.draw(view, options);
            }
        </script>
    </head>
    <body>
        <div id="graphique" style="width:800; height:600"></div>
    </body>
</html>