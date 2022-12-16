try {

    do {

        Write-Host "
        1. B1
        2. B2
        3. B3
        4. B4
        5. Exit
        6. Test try-catch
        "


        $number = Read-Host -prompt "Enter a number 1-6"

        switch ($number) {

            # The following appends the current date and time to 'DailyLog.txt' or creates 'DailyLog.txt' within this script's folder if it does not exist. Then it appends a list of all log files within this script's folder to 'DailyLog.txt'. Finally the user is prompted to select another option.
            1 { Get-Date | Out-File -FilePath "$PSScriptRoot\DailyLog.txt" -Append; Get-ChildItem -Path "$PSScriptRoot" -Filter *.log | Out-File -FilePath "$PSScriptRoot\DailyLog.txt" -Append; break }

            # The following lists all files within the folder this script is in. It lists the files in ascending alphabetical order and tabular format. Then it creates a new file and iputs the list inside the file. Finally the user is prompted to select another option.
            2 { Get-ChildItem $PSScriptRoot | Sort-Object -Property Name | Format-Table | Out-File -FilePath "$PSScriptRoot\C916contents.txt"; break }

            # The following lists counters for CPU % Processor Time and physical memory usage. It lists it 4 times in 5 second intervals. Finally the user is prompted to select another option.
            3 { Get-Counter -Counter "\Processor(_Total)\% Processor Time","\Memory\% Committed Bytes In Use" -MaxSamples 4 -SampleInterval 5; break }

            # The following lists all running processes. Then it sorts the list by processor time greatest to least. Finally the user is prompted to select another option.
            4 { Get-Process | Sort-Object CPU -Descending | Out-GridView; break }

            # The following writes 'goodbye!' to the powershell window and exits the script when the user inputs the number 5.
            5 { 'Goodbye!'; break }

            # The following tests the try-catch.
            6 { $exception = New-Object System.OutOfMemoryException; throw $exception}
        }

    }

    until ($number -eq 5)

}

catch [System.OutOfMemoryException] {
    Write-Host "An error has occured: A system out of memory exception."
}
