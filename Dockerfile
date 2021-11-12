# 6.0-focal is Ubuntu 20.04
FROM mcr.microsoft.com/dotnet/runtime:6.0-focal
RUN apt-get update && apt-get install -y -q apt-utils gnupg2 libunwind8 curl
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    curl -s https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y -q mssql-tools unixodbc-dev wget unzip
RUN wget -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2143497 \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && rm sqlpackage.zip
RUN wget -q -O /opt/sqlpackage/AgileSqlClub.SqlPackageFilter.Core.dll https://github.com/jetizz/DeploymentContributorFilterer/blob/master/lib/AgileSqlClub.SqlPackageFilter.Core.dll?raw=true
