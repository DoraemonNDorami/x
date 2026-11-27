$ErrorActionPreference='Stop'
$c = Get-Content 'C:\email\emails.js' -Raw
$k = [regex]::Match($c,'x-functions-key:\s*([A-Za-z0-9_\-=]+)').Groups[1].Value
$u = [regex]::Match($c,'https://[A-Za-z0-9\-\.]+\.azurewebsites\.net/runtime/webhooks/mcp').Value
function Dump($s,$tag){
  if(-not $s){ "$tag EMPTY"; return }
  "$tag LEN=$($s.Length)"
  for($i=0;$i -lt $s.Length;$i+=16){
    $seg=$s.Substring($i,[Math]::Min(16,$s.Length-$i))
    "$tag$i " + (($seg.ToCharArray()|ForEach-Object{[int]$_}) -join ' ')
  }
}
Dump $u 'URL'
Dump $k 'KEY'
"DONE"
