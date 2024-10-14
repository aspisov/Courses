SELECT c.*
FROM Connection c
         JOIN Station fs ON c.FromStation = fs.Name
         JOIN Station ts ON c.ToStation = ts.Name
WHERE fs.CityName = 'Москва'
  AND ts.CityName = 'Тверь'
  AND NOT EXISTS (SELECT 1
                  FROM Connection c1
                  WHERE c1.TrainNr = c.TrainNr
                    AND c1.FromStation = c.FromStation
                    AND c1.Departure > c.Departure
                    AND c1.Arrival < c.Arrival
                    AND c1.ToStation <> c.ToStation);




WITH MultisegmentRoutes AS (SELECT c1.trainnr as id, fs.cityname as f, ts.cityname as t, c1.departure as dep, c2.arrival as arr
                            FROM connection c1
                                     JOIN connection c2 on c1.tostation = c2.fromstation
                                     JOIN station fs on c1.fromstation = fs.name
                                     JOIN station ts on c2.tostation = ts.name
                            WHERE fs.cityname = 'Москва'
                              and ts.cityname = 'Санкт-Петербург')
SELECT id, f, t, dep, arr
FROM MultisegmentRoutes
WHERE DATE(dep) = DATE(arr)
