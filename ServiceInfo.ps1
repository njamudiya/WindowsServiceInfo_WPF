<# 
.NAME
    Service Info
.SYNOPSIS
    Window service information tool
.DESCRIPTION
    PowerShell GUI to get windows service information
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(400,400)
$Form.text                       = "Service Info"
$Form.TopMost                    = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Enter Service Name"
$Label1.AutoSize                 = $true
$Label1.width                    = 377
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(13,20)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 378
$TextBox1.height                 = 30
$TextBox1.location               = New-Object System.Drawing.Point(12,49)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "ok"
$Button1.width                   = 378
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(12,76)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Groupbox1                       = New-Object system.Windows.Forms.Groupbox
$Groupbox1.height                = 269
$Groupbox1.width                 = 378
$Groupbox1.location              = New-Object System.Drawing.Point(12,120)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.AutoSize                 = $false
$Label2.width                    = 355
$Label2.height                   = 246
$Label2.location                 = New-Object System.Drawing.Point(11,14)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$WinForm1                        = New-Object system.Windows.Forms.Form
$WinForm1.ClientSize             = New-Object System.Drawing.Point(400,400)
$WinForm1.text                   = "Service Info"
$WinForm1.TopMost                = $false

$Form.controls.AddRange(@($Label1,$TextBox1,$Button1,$Groupbox1))
$Groupbox1.controls.AddRange(@($Label2))

$Button1.Add_Click({ ok })
$TextBox1.Add_AcceptsTabChanged({  })
$TextBox1.Add_KeyDown({ et })
$Button1.Add_KeyDown({ et })

function et { }
function et { }
function ok { }
function ok { }
function ok { }
function ok { }
function ok { }


#Service information logic.
function ok{
    $srv = (Get-Culture).textinfo.totitlecase($TextBox1.Text)
    $Groupbox1.Text = "Service "+$srv+" Information" 
    try{
        $srvinfo = Get-Service -Name $srv -ErrorAction Stop
        $snam = $srvinfo.Name
        $sstatus = $srvinfo.Status
        $stype = $srvinfo.StartType
        $Label2.Text = "Name = $snam`nStatus = $sstatus`nType = $stype"
        }
    catch{
        $Label2.Text = $_
        }
}

#Textbox press enter behaviour.
function et{
    if ($_.KeyCode -eq "Enter") {
        ok
    }
}
[void]$Form.ShowDialog()