
Facter.add("current_date") do
    setcode do
        Facter::Core::Execution.exec("/usr/bin/date")
    end
end
