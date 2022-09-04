(() => {
	const btn = document.querySelector('#btn');
	const pub_name = document.querySelector('#fpub_name');
	const pub_nop = document.querySelector('#fpub_nop');
	const pub_address = document.querySelector('#fpub_address');
	const pub_lng = document.querySelector('#fpub_lng');
	const pub_lat = document.querySelector('#fpub_lat');
	const pub_open = document.querySelector('#fpub_open');
	const pub_img = document.querySelector('#pub_img');
	const pub_detail = document.querySelector('#fpub_detail');
	const firm_name = document.querySelector('#firm_name');
	const firm_addr = document.querySelector('#firm_addr');
	const firm_tel_no = document.querySelector('#firm_tel_no');
	const firm_email = document.querySelector('#firm_email');
	const firm_tax_id = document.querySelector('#firm_tax_id');
	const file_check = false;
	
	btn.addEventListener('click', async () => {
		if (pub_name.value.length < 1) {
			errormsg(pub_name, '酒吧名稱不得為空')
			return;
		}
		const pub_nopLength = pub_nop.value.length;
		if (pub_nopLength < 1 || pub_nopLength > 100) {
			errormsg(pub_nop, '酒吧可接受預約人數須介於1~100人')
			return;
		}

		if (pub_address.value.length < 1) {
			errormsg(pub_address, '酒吧地址不得為空')
			return;
		}

		if (pub_detail.value.length < 1) {
			errormsg(pub_detail, '酒吧描述不得為空')
			return;
		}
		if (firm_name.value.length < 1) {
			errormsg(firm_name, '廠商名稱不得為空')
			return;
		}
		if (firm_addr.value.length < 1) {
			errormsg(firm_addr, '廠商地址不得為空')
			return;
		}

		const indiaRegex = /0\d{9}/;
		if (!indiaRegex.test(firm_tel_no.value)) {
			errormsg(firm_tel_no, '電話格式錯誤');
			return;
		}
		const emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;

		if (!emailRule.test(firm_email.value)) {
			errormsg(firm_email, '廠商email格式錯誤');
			return;
		}
		if (!isTax(firm_tax_id)) {
			//            errormsg(firm_tax_id, this.msgTax)
			return;
		}
		if (!window.file_check) {
			errormsg(pub_img, '只能傳送JPG,JPEG,PNG,且不得為空');
			return
		}
		let img = null;
		btn.setAttribute("data-toggle", "modal");
		btn.setAttribute("data-target", "#exampleModal");
		if (pub_img.files[0]) {
			img = await convertBase64(pub_img.files[0])
			//			json = { ...json, pub_img: img };
		}
		let json = JSON.stringify({
			pub_name: pub_name.value,
			pub_nop: pub_nop.value,
			pub_address: pub_address.value,
			pub_lng: pub_lng.value,
			pub_lat: pub_lat.value,
			pub_open: pub_open.value,
			img: img,
			pub_detail: pub_detail.value,
			firm_name: firm_name.value,
			firm_addr: firm_addr.value,
			firm_tel_no: firm_tel_no.value,
			firm_email: firm_email.value,
			firm_tax_id: firm_tax_id.value,
		});

			console.log(json);
		fetch('PubRegister', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: json,
		})
			.then(resp => resp.json())
			.then(body => {
				const { successful } = body;
				const { message } = body;
				if (successful) {
					document.querySelector('.modal-body').innerHTML = message + `<br>請等候管理員審核，點擊確認跳轉`
				} else {
					document.querySelector('.modal-body').innerHTML = message + `<br>請聯繫客服協助處理`
				}
				btn.removeAttribute("data-toggle");
				btn.removeAttribute("data-target");
			});
	});

})();

pub_img.addEventListener('change', function(e) {
	var file_id = e.target.id;
	file_check = check_multifile_logo($("#" + file_id).prop("files")[0]['name']);
	//    多檔案使用
	//    for (i = 0; i < $("#" + file_id).prop("files").length; i++) {
	if (file_check) {
	} else {
		errormsg(pub_img, "只能傳送JPG,JPEG,PNG");
	}


	//    }
});


function check_multifile_logo(file) {
	var extension = file.substr((file.lastIndexOf('.') + 1))
	if (extension === 'jpg' || extension === 'jpeg' || extension === 'gif' || extension === 'png' || extension === 'bmp') {
		return true;
	} else {
		return false;
	}
}




function errormsg(e, msgtext) {
	e.classList.add('is-invalid');
	e.focus();
	e.addEventListener('change', function e1() {
		if (e == pub_img) {
			if (e.parentElement.children.length > 3) {
				e.parentElement.removeChild(e.parentElement.lastChild);
			}
		} else {
			if (e.parentElement.children.length > 1) {
				e.parentElement.removeChild(e.parentElement.lastChild);
			}

		}
		e.classList.remove('is-invalid');
		e.removeEventListener('change', e1);
	});
	const msg = document.createElement('div')
	msg.style.color = "red";
	msg.textContent = msgtext;
	if (e == pub_img) {
		if (e.parentElement.children.length > 3) {
			e.parentElement.removeChild(e.parentElement.lastChild);
		}
	} else {
		if (e.parentElement.children.length > 1) {
			e.parentElement.removeChild(e.parentElement.lastChild);
		}

	}
	e.parentElement.appendChild(msg);
}
const convertBase64 = (file) => {
	return new Promise((resolve, reject) => {
		const fileReader = new FileReader();
		fileReader.readAsDataURL(file);

		fileReader.onload = () => {
			resolve(fileReader.result);
		};

		fileReader.onerror = () => {
			reject(false);
		};
	});
};
function isTax(tax) {
	const cx = [1, 2, 1, 2, 1, 2, 4, 1];
	const cnum = tax.value.split('');
	let sum = 0;
	function cc(num) {
		let total = num;
		if (total > 9) {
			let s = total.toString();
			const n1 = s.substring(0, 1) * 1;
			const n2 = s.substring(1, 2) * 1;
			total = n1 + n2;
		}
		return total;
	}
	if (tax.value.length !== 8) {
		errormsg(tax, '統一編號錯誤需8個字')
		return false;
	}
	cnum.forEach((item, index) => {
		if (tax.value.charCodeAt() < 48 || tax.value.charCodeAt() > 57) {
			errormsg(tax, '統編錯誤，要有 8 個 0-9 數字組合')
			return false;
		}
		sum += cc(item * cx[index]);
	});
	if (sum % 10 === 0) {
		return true;
	} else if (cnum[6] === '7' && (sum + 1) % 10 === 0) {
		return true;
	} else {
		errormsg(tax, '統編錯誤')
		return false;
	}
}