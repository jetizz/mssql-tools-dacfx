FROM mcr.microsoft.com/dotnet/core/runtime
RUN apt-get update && apt-get install -y -q apt-utils gnupg2 libunwind8
RUN curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl -s https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y -q mssql-tools unixodbc-dev wget unzip
RUN wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2143497 \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && rm sqlpackage.zip