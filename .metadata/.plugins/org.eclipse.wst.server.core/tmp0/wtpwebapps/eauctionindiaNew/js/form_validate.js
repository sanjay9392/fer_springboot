var $ = jQuery;

$(document).ready(function() {
   
    $("#vehicleModel_Form").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            vehicleModel: {required:true},
            capacity: {required:true},
        },
        messages: {
            vehicleModel: {required:"vehicleModel Required"},
            capacity: {required:"capacity Required"},
           
        }

    });
	$("#VehicleForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
			//file1:{required:true},
            vehicleNo: {required:true},
           
           
        },
        messages: {
			//file1:{require:""},
            vehicleNo: {required:"VehicleNo Required"},
          
            }
    });
	$("#TarrifTypeForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            typeName: {required:true},
            typeDescr: {required:true},
           
           },
        messages: {
            typeName: {required:"Type Name Required"},
			typeDescr: {required:"Type Description Required"},
            
           }
    });
	$("#PackageForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            pkgName: {required:true},
            pkgDescr: {required:true},
            
           },
        messages: {
            pkgName: {required:"Package Name Required"},
			pkgDescr: {required:"Type Description Required"},

           }
    });
	$("#TarriffForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            price: {required:true},
            perKM: {required:true},
            kmLimit: {required:true},
			hrLimit: {required:true},
			extraPrice: {required:true},
			extraPerKM: {required:true},
			priceFormat: {required:true},
			extraFormat: {required:true},
           },
        messages: {
            price: {required:"Price Required"},
			perKM: {required:"PerKm Required"},
            kmLimit: {required:"KmLimit Required"},
            hrLimit: {required:"HrLimit Required"},
			extraPrice: {required:"Extra Price Required"},
			extraPerKM: {required:"Extra Perkm Required"},
			priceFormat: {required:"Price Format  Required"},
			extraFormat: {required:"Extra Format Required"},
           }
    });
	$("#BookingRequestForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
             requiredDate: {required:true},
             requiredTime: {required:true},
			 noPassengers: {required:true},
			 luggages: {required:true},
			 pickupPoint: {required:true},
			 pickupLandmark: {required:true},
			 dropPoint: {required:true},
			 dropLandmark: {required:true},
			 channel: {required:true},
			 status: {required:true},
			 comments: {required:true},
			

            
           },
        messages: {
            requiredDate: {required:"Required Date Required"},
			requiredTime: {required:"Required Time Required"},
			noPassengers: {required:"No of Passengers Required"},
			luggages: {required:"No of Luggages Required"},
			pickupPoint: {required:"Pick up point Required"},
			pickupLandmark: {required:"Pick up Landmark Required"},
			dropPoint: {required:"Drop Point Required"},
			dropLandmark: {required:"Drop LandMark Required"},
			channel: {required:"Channel Required"},
			status: {required:"Status Required"},
			comments: {required:"Comments Required"},
						
           }
    });
	$("#AllotmentForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            reportingDateTime: {required:true},
			allotmentDt: {required:true},
            
           },
        messages: {
            reportingDateTime: {required:"Reporting Date Time Required"},
            allotmentDt: {required:"Allotment Date Required"},
			
           }
    });
	$("#BookingOrderForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            requiredDate: {required:true},
             requiredTime: {required:true},
			 noPassengers: {required:true},
			 luggages: {required:true},
			 pickupPoint: {required:true},
			 pickupLandmark: {required:true},
			 dropPoint: {required:true},
			 dropLandmark: {required:true},
			 channel: {required:true},
			 status: {required:true},
			 comments: {required:true},
           },
        messages: {
             requiredDate: {required:"Required Date Required"},
			requiredTime: {required:"Required Time Required"},
			noPassengers: {required:"No of Passengers Required"},
			luggages: {required:"No of Luggages Required"},
			pickupPoint: {required:"Pick up point Required"},
			pickupLandmark: {required:"Pick up Landmark Required"},
			dropPoint: {required:"Drop Point Required"},
			dropLandmark: {required:"Drop LandMark Required"},
			channel: {required:"Channel Required"},
			status: {required:"Status Required"},
			comments: {required:"Comments Required"},
			
           }
    });
	$("#BookingPaymentForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            payAmt: {required:true},
			
			payDt: {required:true},
			
            
           },
        messages: {
            payAmt: {required:"Pay Amount Required"},
			payDt: {required:"Pay Date Required"},
			
			
           }
    });

	$("#BookingProcessForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            calledBy: {required:true},
			
			callerType: {required:true},
			calledTime: {required:true},
			status: {required:true},
			comments: {required:true},
				

			
            
           },
        messages: {
            calledBy: {required:"Called By Required"},
			callerType: {required:"Caller Type Required"},
			calledTime: {required:"Caller Time Required"},
			status: {required:"Status Required"},
			comments: {required:"comments Required"},
			
			
           }
    });

$("#CustomerForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            cname: {required:true},
			
			
			mobile: {required:true},
			email: {required:true},
				
				

			
            
           },
        messages: {
            cname: {required:"Customer Name Required"},
			
			mobile: {required:"mobile no Required"},
			email: {required:"email id Required"},
			
			
           }
    });





$("#DriverPayModeForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            bankName: {required:true},
			
			
			accNo: {required:true},
			slipDt: {required:true},
				
				

			
            
           },
        messages: {
            bankName: {required:"Bank Name Required"},
			
			accNo: {required:"Account no Required"},
			slipDt: {required:"SlipDate Required"},
			
			
           }
    });
$("#DriverForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            driverName: {required:true},
			
			
			licenseNo: {required:true},
			
				
				

			
            
           },
        messages: {
            driverName: {required:"Driver Name Required"},
			
			licenseNo: {required:"Licence no Required"},
			
			
			
           }
    });
	$("#ExpectedForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            expectedInDt: {required:true},
			
			
			expectedOutDt: {required:true},
			
				
				

			
            
           },
        messages: {
            expectedInDt: {required:"Expected In Date Required"},
			
			expectedOutDt: {required:"Expected Out Required"},
			
			
			
           }
    });
	$("#DriverFlowForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            flowInOut: {required:true},
			
			
			flowDt: {required:true},
			
				
				

			
            
           },
        messages: {
            flowInOut: {required:"Flow(In/Out) Required"},
			
			flowDt: {required:"Flow date Required"},
			
			
			
           }
    });

	$("#DriverGivenAmtForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            amt: {required:true},
			
			
			paidDt: {required:true},

			payMode: {required:true},
			
				
				

			
            
           },
        messages: {
            amt: {required:"Amount Required"},
			
			paidDt: {required:"Paid date Required"},

			payMode: {required:"PayMode Required"},
			
			
			
           }
    });

	$("#EmployeeForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            ename: {required:true},
			
			
			email: {required:true},

			mobile: {required:true},
			
				
				

			
            
           },
        messages: {
            ename: {required:"Employee Name Required"},
			
			email: {required:"Email Address Required"},

			mobile: {required:"Mobile No Required"},
			
			
			
           }
    });

	$("#EmployeeRegisterForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            designation: {required:true},
			
			
			joinDt: {required:true},

			
			
				
				

			
            
           },
        messages: {
            designation: {required:"designation Required"},
			
			joinDt: {required:"Join Date Required"},

			
			
			
			
           }
    });

	$("#FeedbackForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            cname: {required:true},
			
			
			mobile: {required:true},

			email: {required:true},
			},

        messages: {
            cname: {required:"Customer Name Required"},
			
			mobile: {required:"Mobile No Required"},

			email: {required:"Email Required"},

			
			
			
			
           }
    });

	$("#NewsForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            title: {required:true},
			
			
			description: {required:true},

			status: {required:true},
			},

        messages: {
            title: {required:"Title Required"},
			
			description: {required:"Description Required"},

			status: {required:"status Required"},

			
			
			
			
           }
    });

$("#RequestForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
            assignedBy: {required:true},
			
			
			assignDt: {required:true},

			
			},

        messages: {
            assignedBy: {required:"assignedBy Required"},
			
			assignDt: {required:"assignDate Required"},

			

			
			
			
			
           }
    });





});
function submit_Vmodels() {
	//alert("submit form");
	if($("#vehicleModel_Form").valid()) {
		document.vehicleModelForm.submit();
	}
}
function submitVehicles(){
	if($("#VehicleForm").valid()) {
		document.vehicleForm.submit();
	}
}
function submitTariffTypes(){
	if($("#TarrifTypeForm").valid()) {
		document.TarrifTypeForm.submit();
	}
}
function submitPackages(){
	if($("#PackageForm").valid()) {
		document.PackageForm.submit();
	}
}
function submitTariff(){
	if($("#TarriffForm").valid()) {
		document.TarriffForm.submit();
	}
}
function submitBookingRequest(){
	if($("#BookingRequestForm").valid()) {
		document.BookingRequestForm.submit();
	}
}
function submitAllotments(){
	if($("#AllotmentForm").valid()) {
		document.AllotmentForm.submit();
	}
}
function submitBookingOrders(){
	if($("#BookingOrderForm").valid()) {
		document.BookingOrderForm.submit();
	}
}
function submitBookingPayments(){
	if($("#BookingPaymentForm").valid()) {
		document.BookingPaymentForm.submit();
	}
}
function submitBookingProcess(){	
	if($("#BookingProcessForm").valid()) {
		document.BookingProcessForm.submit();
	}
}
function submitCustomers(){
	if($("#CustomerForm").valid()) {
		document.CustomerForm.submit();
	}
}
function submitPaymode(){
	if($("#DriverPayModeForm").valid()) {
		document.DriverPayModeForm.submit();
	}
}
function submitDriver(){
	if($("#DriverForm").valid()) {
		document.DriverForm.submit();
	}
}
function submitExpectedFlow(){
	if($("#ExpectedForm").valid()) {
		document.ExpectedForm.submit();
	}
}
function submitFlow(){
	if($("#DriverFlowForm").valid()) {
		document.DriverFlowForm.submit();
	}
}
function submitGivenAmt(){
	if($("#DriverGivenAmtForm").valid()) {
		document.DriverGivenAmtForm.submit();
	}
}

function submitEmployee(){
	if($("#EmployeeForm").valid()) {
		document.EmployeeForm.submit();
	}
}

function submitEmpRegister(){
	if($("#EmployeeRegisterForm").valid()) {
		document.EmployeeRegisterForm.submit();
	}
}

function submitFeedback(){
	if($("#FeedbackForm").valid()) {
		document.FeedbackForm.submit();
	}
}
function submitNews(){
	if($("#NewsForm").valid()) {
		document.NewsForm.submit();
	}
}
function submitRequestAssign(){
	if($("#RequestForm").valid()) {
		document.RequestForm.submit();
	}
}