* @ValidationCode : MjotMTMzNTk0MzcyOkNwMTI1MjoxNDgxNTU2MjIyNDAwOm11bWVzaDotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE2MTIuMjAxNjEyMDItMDk1NjotMTotMQ==
* @ValidationInfo : Timestamp         : 12 Dec 2016 16:23:42
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : mumesh
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201612.20161202-0956
$PACKAGE FT.Validation
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
SUBROUTINE V.FT.VALIDATION(P1)

    $INSERT I_COMMON
    $INSERT I_EQUATE

    IF R.NEW(FT.CREDIT.AMOUNT) GT 500 THEN
        E = "Amount greater than 500 (DS packager demo)"
    END
END
