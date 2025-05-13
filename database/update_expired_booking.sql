USE MeetingRoomBookingSystem;    7836888822
EXEC UpdateExpiredBookings;


	<connectionStrings>
		<add name="MRBSConnectionString" connectionString="Server=sql.bsite.net\MSSQL2016;Database=quickbook; User ID=QuickBook; Password=quickbook@123;Integrated Security=True;Encrypt=False" providerName="System.Data.SqlClient" />
</connectionStrings>

<connectionStrings>
    <add name="DefaultConnection"
         connectionString="Server=sql.bsite.net\MSSQL2016; Database=nestfinderbysudhir_NestFinder; User ID=nestfinderbysudhir_NestFinder; Password=Sudhir@123; MultipleActiveResultSets=True; TrustServerCertificate=True;"
         providerName="System.Data.SqlClient" />
</connectionStrings>

<add name = "MRBSConnectionString "workstation id=MeetingRoomBookingSystem.mssql.somee.com;packet size=4096;user id=QuickBook_SQLLogin_1;pwd=59iz6wdfbu;data source=MeetingRoomBookingSystem.mssql.somee.com;persist security info=False;initial catalog=MeetingRoomBookingSystem;TrustServerCertificate=True/>