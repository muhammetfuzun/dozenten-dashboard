# dozenten-dashboard

Dozenten-Cockpit: Stunden, Rechnungen, Schüler und Akquise für die Dozententätigkeit (NTG-Nachhilfe).

Eine einzige Datei, kein Build: `index.html` im Browser öffnen oder über GitHub Pages hosten.

## Daten und Synchronisierung (Supabase)

- Anmeldung per E-Mail und Passwort. Der komplette Stand liegt als eine JSON-Zeile pro Nutzer in der Tabelle `cockpit_state`.
- Zugriff nur auf die eigene Zeile (Row Level Security). Der Publishable Key im Code ist dafür gedacht und gibt ohne Login keinen Zugriff.
- Einmalige Einrichtung: `supabase/setup.sql` im Supabase SQL Editor ausführen.
- Zusätzlich wird ein lokaler Stand im Browser gehalten. Ohne Anmeldung ist „nur lokal nutzen“ möglich.
- Die Startdaten in der Datei sind leer. Es stehen keine privaten Daten im Repo.
- Sicherung: Einstellungen → „Daten kopieren“, Wiederherstellen über „Importieren“.

Rechnungs-PDFs werden mit jsPDF (cdnjs) erzeugt und direkt heruntergeladen.
