# view_coverage.tcl
open_cover_database [lindex $argv 0]
start_gui

# Opcional: abrir también el waveform si existe
set wdb_file [file rootname [lindex $argv 0]].wdb
if {[file exists $wdb_file]} {
    open_wave_database $wdb_file
}