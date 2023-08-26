class GetUsersModel {
    List<LoginDetail> loginDetails;
    List<LoginStatus> loginStatus;

    GetUsersModel({
        required this.loginDetails,
        required this.loginStatus,
    });

    factory GetUsersModel.fromJson(Map<String, dynamic> json) => GetUsersModel(
        loginDetails: List<LoginDetail>.from(json["LoginDetails"].map((x) => LoginDetail.fromJson(x))),
        loginStatus: List<LoginStatus>.from(json["LoginStatus"].map((x) => LoginStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "LoginDetails": List<dynamic>.from(loginDetails.map((x) => x.toJson())),
        "LoginStatus": List<dynamic>.from(loginStatus.map((x) => x.toJson())),
    };
}

class LoginDetail {
    int uid;
    String id;
    int businessUserUid;
    int employeeUid;
    bool isDisabled;
    String reEnableTime;
    bool isAdAuthenticationEnabled;
    int numborOfLoginAttempts;
    String lastLoginAttemptTime;
    bool isMultiSite;
    bool isDownloadLog;
    String expiryDate;
    String firstName;
    String lastName;
    String telephone1;
    String email;
    String imageName;
    String bankBranch;
    int distributorUid;
    int annualLeaveCount;
    int casualLeaveCount;
    int sickLeaveCount;
    String notes;
    int businessChannelUid;
    int mptDesignationUid;
    bool isPreSales;
    int isLock;
    int siteUid;
    int warehouseUid;
    int warehouseMptTypeEnum;
    String reportHeader1;
    String reportHeader2;
    String streetAddress;
    String distributorTelephone1;
    String distributorTelephone2;
    String vatNumber;
    int vatRate;
    int primaryWarehouseUid;
    bool hasMultipleDistributors;

    LoginDetail({
        required this.uid,
        required this.id,
        required this.businessUserUid,
        required this.employeeUid,
        required this.isDisabled,
        required this.reEnableTime,
        required this.isAdAuthenticationEnabled,
        required this.numborOfLoginAttempts,
        required this.lastLoginAttemptTime,
        required this.isMultiSite,
        required this.isDownloadLog,
        required this.expiryDate,
        required this.firstName,
        required this.lastName,
        required this.telephone1,
        required this.email,
        required this.imageName,
        required this.bankBranch,
        required this.distributorUid,
        required this.annualLeaveCount,
        required this.casualLeaveCount,
        required this.sickLeaveCount,
        required this.notes,
        required this.businessChannelUid,
        required this.mptDesignationUid,
        required this.isPreSales,
        required this.isLock,
        required this.siteUid,
        required this.warehouseUid,
        required this.warehouseMptTypeEnum,
        required this.reportHeader1,
        required this.reportHeader2,
        required this.streetAddress,
        required this.distributorTelephone1,
        required this.distributorTelephone2,
        required this.vatNumber,
        required this.vatRate,
        required this.primaryWarehouseUid,
        required this.hasMultipleDistributors,
    });

    factory LoginDetail.fromJson(Map<String, dynamic> json) => LoginDetail(
        uid: json["UID"],
        id: json["ID"],
        businessUserUid: json["BusinessUserUID"],
        employeeUid: json["EmployeeUID"],
        isDisabled: json["IsDisabled"],
        reEnableTime: json["ReEnableTime"],
        isAdAuthenticationEnabled: json["IsADAuthenticationEnabled"],
        numborOfLoginAttempts: json["NumborOfLoginAttempts"],
        lastLoginAttemptTime: json["LastLoginAttemptTime"],
        isMultiSite: json["IsMultiSite"],
        isDownloadLog: json["IsDownloadLog"],
        expiryDate: json["ExpiryDate"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        telephone1: json["Telephone1"],
        email: json["Email"],
        imageName: json["ImageName"],
        bankBranch: json["BankBranch"],
        distributorUid: json["DistributorUID"],
        annualLeaveCount: json["AnnualLeaveCount"].toInt(),
        casualLeaveCount: json["CasualLeaveCount"].toInt(),
        sickLeaveCount: json["SickLeaveCount"].toInt(),
        notes: json["Notes"],
        businessChannelUid: json["BusinessChannelUID"],
        mptDesignationUid: json["mpt_DesignationUID"],
        isPreSales: json["IsPreSales"],
        isLock: json["IsLock"],
        siteUid: json["SiteUID"],
        warehouseUid: json["WarehouseUID"],
        warehouseMptTypeEnum: json["WarehouseMptTypeEnum"],
        reportHeader1: json["ReportHeader1"],
        reportHeader2: json["ReportHeader2"],
        streetAddress: json["StreetAddress"],
        distributorTelephone1: json["DistributorTelephone1"],
        distributorTelephone2: json["DistributorTelephone2"],
        vatNumber: json["VATNumber"],
        vatRate: json["VATRate"].toInt(),
        primaryWarehouseUid: json["primaryWarehouseUID"],
        hasMultipleDistributors: json["HasMultipleDistributors"],
    );

    Map<String, dynamic> toJson() => {
        "UID": uid,
        "ID": id,
        "BusinessUserUID": businessUserUid,
        "EmployeeUID": employeeUid,
        "IsDisabled": isDisabled,
        "ReEnableTime": reEnableTime,
        "IsADAuthenticationEnabled": isAdAuthenticationEnabled,
        "NumborOfLoginAttempts": numborOfLoginAttempts,
        "LastLoginAttemptTime": lastLoginAttemptTime,
        "IsMultiSite": isMultiSite,
        "IsDownloadLog": isDownloadLog,
        "ExpiryDate": expiryDate,
        "FirstName": firstName,
        "LastName": lastName,
        "Telephone1": telephone1,
        "Email": email,
        "ImageName": imageName,
        "BankBranch": bankBranch,
        "DistributorUID": distributorUid,
        "AnnualLeaveCount": annualLeaveCount,
        "CasualLeaveCount": casualLeaveCount,
        "SickLeaveCount": sickLeaveCount,
        "Notes": notes,
        "BusinessChannelUID": businessChannelUid,
        "mpt_DesignationUID": mptDesignationUid,
        "IsPreSales": isPreSales,
        "IsLock": isLock,
        "SiteUID": siteUid,
        "WarehouseUID": warehouseUid,
        "WarehouseMptTypeEnum": warehouseMptTypeEnum,
        "ReportHeader1": reportHeader1,
        "ReportHeader2": reportHeader2,
        "StreetAddress": streetAddress,
        "DistributorTelephone1": distributorTelephone1,
        "DistributorTelephone2": distributorTelephone2,
        "VATNumber": vatNumber,
        "VATRate": vatRate,
        "primaryWarehouseUID": primaryWarehouseUid,
        "HasMultipleDistributors": hasMultipleDistributors,
    };
}

class LoginStatus {
    String status;

    LoginStatus({
        required this.status,
    });

    factory LoginStatus.fromJson(Map<String, dynamic> json) => LoginStatus(
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
    };
}
