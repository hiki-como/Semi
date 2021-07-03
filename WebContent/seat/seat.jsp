<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
		*{
            box-sizing: border-box;
        }
        body{
        	text-align:center;
        }
		.container{
            position: fixed;
            width: 70%;
            text-align: center;
            top: 10%;
            left:20%
        }
      
        .day>div{
            display: inline-block;
            width: 8%;
        }
        .fas {
            font-size: 150%;
            text-align: center;
        }

        .seat {
            background-color: white
        }

        div {
            width: 700px;
            border: 1px solid black;
            font-size: 50px bold;
        }
    </style>
    <script>
        $(function () {
            let sub = 0;
            let before_seat = null;
            for (let index = 1; index <= 36; index += 6) {
                let tr = $("<tr>");
                for (let index2 = index; index2 < index + 6; index2++) {
                    let number = index2 - sub;
                    let td = $("<td class=seat data-seat=" + number + " data-Ischoose= false align=center>")
                    if ((index2 + 2) % 6 != 0) td.append("<i class=\"fas fa-desktop\">" + "<br>" + number + "번 좌석")
                    else {
                        td.css("width", "100");
                        td.attr("data-seat", "empty")
                        sub++;
                    }
                    tr.append(td);
                }
                $("#table2").append(tr);
            }

            $(document).on("click", ".seat", function () {
                if ($(this).attr("data-seat") !== "empty" && $(this).attr("data-Ischoose") !== "true") {
                    if (before_seat == null) {
                        before_seat = $(this);
                    } else {
                        $(before_seat).css("background-color", "white");
                        before_seat = $(this);
                    }
                    $(this).css("background-color", "gray");
                    $("#choose_seat").text("선택하신 좌석은 " + $(this).attr("data-seat") + "번 입니다")
                    $("#choose_seat").css("font-size", "40px")
                }
            })
        })

    </script>
</head>
<body>
	<div class="container">
        <div class="day">
            <div class="mon">월</div>
            <div class="tue">화</div>
            <div class="wed">수</div>
            <div class="thu">목</div>
            <div class="fri">금</div>
            <div class="sat">토</div>
            <div class="sun">일</div>
        </div>
    <center>
        [KH 종로반 E 클래스 교실 구조]
        <table border="1" width=700 id=table2>
            <tr>
                <td colspan="3" align="left">
                    <i class="fas fa-door-open" style="font-size: 200%;"></i>출구
                </td>
                <td></td>
                <td colspan="2" align="">
                    <i class="fas fa-chalkboard-teacher">강사님 자리</i>
                </td>
            </tr>
        </table>
        <div id=choose_seat>
        </div>
    </center>
</body>
</html>