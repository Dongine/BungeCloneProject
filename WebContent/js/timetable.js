// "2021학년도 2학기 1학년 시간표"

	var subjects = ["세포생물학<br/>(김용석)",			// 0
			"유기화학<br/>(오요한)",					// 1
			"의학용어학1<br/>(황세진)",					// 2
			"인간심리학<br/>(김은경)",					// 3
			"문화와비평<br/>(정희경, 김도환, 김유미<br/>이창호, 김덕언, 강예지)<br/>*6개 반",	// 4
			"의과학기초실습<br/>(박신영)",				// 5
			"생물리학<br/>(정승준)",					// 6
			"인체영양학개론<br/>(김미경)",				// 7
			"사람.의료.사회2<br/>(백두진)",				// 8
			"의료기기의이해<br/>(김인영)"];				// 9
	var colors = [
		"#92d050",		// 146, 208, 80
		"#e2efda",		// 226, 239, 218
		"#FFFF00",		// 255, 255, 0
		"#ffd966",		// 255, 217, 102
		"#ffe699",		// 255, 230, 153
		"#fff2cc",		// 255, 242, 204
		"#d9d9d9",		// 217, 217, 217
		"#fce4d6",		// 252, 228, 214
		"#ddebf7",		// 221, 235, 247
		"#9ec3ff"		// 158, 195, 255
	];
	
	var timetable = [
		"09:00~09:30",
		"09:30~10:00",
		"10:00~10:30",
		"10:30~11:00",
		"11:00~11:30",
		"11:30~12:00",
		"12:00~12:30",
		"12:30~13:00",
		"13:00~13:30",
		"13:30~14:00",
		"14:00~14:30",
		"14:30~15:00",
		"15:00~15:30",
		"15:30~16:00",
		"16:00~16:30",
		"16:30~17:00"
	];
	
	var arr = new Array(16);
	for(var i = 0; i<=15; i++) {
		arr[i] = new Array(5);		
	}
	arr[0][0] = subjects[0];
	arr[1][0] = subjects[0];
	arr[2][0] = subjects[0];
	arr[4][0] = subjects[1];
	arr[5][0] = subjects[1];
	arr[6][0] = subjects[1];
	arr[7][0] = subjects[1];

	arr[0][1] = subjects[2];
	arr[1][1] = subjects[2];
	arr[2][1] = subjects[2];
	arr[3][1] = subjects[2];
	arr[4][1] = subjects[3];
	arr[5][1] = subjects[3];
	arr[6][1] = subjects[3];
	arr[7][1] = subjects[3];

	arr[0][2] = subjects[0];
	arr[1][2] = subjects[0];
	arr[2][2] = subjects[0];
	arr[4][2] = subjects[4];
	arr[5][2] = subjects[4];
	arr[6][2] = subjects[4];
	arr[7][2] = subjects[4];
	arr[12][2] = subjects[5];
	arr[13][2] = subjects[5];
	arr[14][2] = subjects[5];
	arr[15][2] = subjects[5];

	arr[0][3] = subjects[6];
	arr[1][3] = subjects[6];
	arr[2][3] = subjects[6];
	arr[4][3] = subjects[7];
	arr[5][3] = subjects[7];
	arr[6][3] = subjects[7];
	arr[7][3] = subjects[7];

	arr[0][4] = subjects[8];
	arr[1][4] = subjects[8];
	arr[2][4] = subjects[8];
	arr[3][4] = subjects[8];
	arr[4][4] = subjects[9];
	arr[5][4] = subjects[9];
	arr[6][4] = subjects[9];
	arr[7][4] = subjects[9];
	arr[11][4] = subjects[6];
	arr[12][4] = subjects[6];
	arr[13][4] = subjects[6];
	