import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prathima_loan_app/controllers/loan_agreement_controller.dart';
import 'package:prathima_loan_app/customs/custom_button.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';
import 'package:prathima_loan_app/helpers/route_helper.dart';
import 'package:prathima_loan_app/utils/colors.dart';

class LoanAgreementCard extends StatelessWidget {
  const LoanAgreementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomText(
                    text: "LOAN AGREEMENT",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "THIS LOAN AGREEMENT(“Agreement”) is entered "
                    "into Chennai on this ____________day of _________ 201_",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomText(
                    text: "BETWEEN",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Mr/Mrs/Miss.S/o,W/o, D/o. Aged About hereinafter referred to as"
                    " “the Borrower” (which expression shall, unless repugnant to the context or"
                    " meaning thereof, be deemed to mean and include his / her / its / their "
                    "respective heirs, administrators, executors, legal representatives "
                    "(where the borrower is an individual / sole proprietor) , Successors "
                    "(where the Borrower is a Company incorporated under the Companies Act 1956/2013 or"
                    " any other body corporate) , the partner(s) from time to time of the firm, the survivor(s) "
                    "of them and their heirs, executors administrators, legal representatives and the "
                    "successors of the partner(s) (where the Borrower is a partnership firm) of the First part",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomText(
                    text: "AND",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "M/s PRATHIMA FINANCIAL SERVICES, a Registered Partnership Firm,"
                    " having its Registered Office at No.15, Meeran Sahib Street, "
                    "mallika Complex, First Floor, Mount Road, Chennai – 600 002 hereinafter"
                    " referred to as the “Lender”, which expression shall, "
                    "unless it be repugnant to the subject or context thereof, "
                    "shall mean and include its successors, transferees and assigns, "
                    "of the Other Part.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "The Borrower and the Lender shall hereinafter be referred to "
                    "individually as “Party” or collectively as “Parties”",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "WHERE AS",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "1. The Lender is engaged in the business of providing finance "
                    "to a wide range of customers including individuals and small "
                    "and medium enterprises.1. The Lender is engaged in the business of"
                    " providing finance to a wide range of customers including individuals"
                    " and small and medium enterprises.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "2. The Borrower is engaged in carrying on bonafide business"
                    " activities/ employed in Private Sector/Govt Sector/ MNC Companies "
                    "who is a professional/Employee.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "3. The Borrower is a Major and resident in India and is"
                    " competent to execute this Agreement. The execution hereof "
                    "constitutes legal, valid and binding obligations of the Borrower; "
                    "and that there are no suits, actions or proceedings against the"
                    " Borrower pending before any court of law, which might affect the "
                    "Borrower in performance of the obligations hereunder.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomText(
                    text: "NOW, THEREFORE, THE PARTIES HEREBY AGREE AS UNDER:",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "1. The Borrower had approached the Lender for a Loan amount of Rs.___________, (Rupees only) "
                    "(the loan amount hereinafter shall be referred to as ‘the loan’ or"
                    " “Loan” or “Loan Amount”) on the terms, conditions and the purpose as stated / contained "
                    "in this Agreement. The Borrower hereby confirms that the funds are for purposes of the "
                    "Borrower’s own use.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "2. The Lender hereby grants to the Borrower and the Borrower "
                    "agrees to avail from the Lender, a financial assistance of a Loan "
                    "Amount on the terms and conditions contained in this Agreement."
                    " The Tenure, interest rate (“Interest”) and the schedule of repayment "
                    "in respect of the Loan shall be as specified in Schedule hereunder "
                    "as set out herein or as may be amended in accordance with this agreement "
                    "from time to time.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "1. Repayment",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "In consideration of the Lender extending the “Loan”, the Borrower"
                    " shall jointly and severally repay the Loan along with Interest "
                    "in accordance with the Repayment Schedule set out in Schedule of "
                    "this Agreement. The Borrower hereby confirms having perused, "
                    "understood that the interest is applied on the principal on a "
                    "daily basis and agreed to the method of computation of EMI and the "
                    "effective or Annualized rate of interest as stipulated in Schedule."
                    "The Borrower further agrees to pay the EMI as per schedule hereto and "
                    "shall also pay overdue interest arising out of the default in repayment"
                    " of installments, any other charges such as Bank charges, pre-payment "
                    "charge etc., together with Goods and Services and all other statutory "
                    "taxes and levies prevailing at the time of execution of this agreement "
                    "and as may be amended by Statute from time to time.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "The Borrower shall unconditionally and irrevocably authorize the "
                    "Bank through Standing instructions or Electronic Clearing System "
                    "(ECS) instructions / ACH to debit the Borrower account towards the "
                    "dues payable to the Lender. The Borrower further agrees to maintain "
                    "sufficient balance in the account to enable his / her /its Bankers to "
                    "facilitate the debit of the account, and remittance of the amount so"
                    " debited to the credit of the Lender. Alternatively, where the ECS / ACH"
                    " facility is not available for the Borrower, the Borrower may issue to"
                    " the Lender post dated cheques (PDC) towards repayment of the "
                    "instalments / dues arising under this Agreement and undertakes that "
                    "sufficient balance will be made available for honouring the cheques on"
                    " the due date as and when presented for payment by the Lender on or after"
                    " the due date.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "2.SECURITY",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "The Borrower hereby agree that, the Lender shall have right of lien "
                    "over all the assets of the Borrower for the Loan availed by the Borrower "
                    "either under this Agreement or under any other agreement or financial "
                    "assistance availed by the Borrower from the Lender. The Borrower hereby "
                    "agree that they shall not in any way, dispose off their assets without "
                    "the prior written consent of the Lender.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "3. Event of Default",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "The happening of the following events shall constitute an "
                    "event of default (“Event of Default”)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a) Any non-compliance by the Borrower the terms & conditions of this "
                    "Agreement or any other agreement entered into in respect of this "
                    "Loan or any other financial assistance availed of by the Borrower "
                    "from the Lender;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "b) Any breach of this Agreement by the Borrower;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "c) Non adherence to the Repayment Schedule;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "d) Insolvency, winding up, dissolution of the Borrower and "
                    "inability of the Borrower to repay their debts;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "e) Any concealment of any material document or event by the Borrower;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "f) Submission of any forged document by the Borrower;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "g) Any other event which in the sole opinion of the Lender"
                    " would endanger the repayment of the Loan Amount.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "4. Consequences of an Event of Default",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a) The entire Loan Amount along with Interest for the entire"
                    " period shall immediately become due and payable, "
                    "and the Lender shall have the right to recall the entire "
                    "loan together with interest for the entire period, the overdue"
                    " interest arising on account of default, Bank charges and other"
                    " Charges, All charges are payable by the Borrower together with"
                    " applicable taxes.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "b) Lender shall be entitled to enforce the Security, if any available;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "c) Lender shall be entitled to proceed against and "
                    "take any action against the Borrower in order to realize "
                    "the Loan Amount along with Interest, Charges and expenses;",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "d) In addition to the rights specified in this Agreement, "
                    "the Lender shall be entitled to take all or any action with or"
                    " without intervention of the Courts to recover the monies due and"
                    " payable by the Borrower under this Agreement.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "e) Notwithstanding any other rights available to the Lender under"
                    " this Agreement, the Lender shall be entitled to initiate criminal"
                    " proceeding or any other appropriate actions against the Borrower"
                    " if at any time the Lender at its sole discretion has sufficient grounds "
                    "to believe that the Borrower has / have made any misrepresentations"
                    " and / or submitted any forged documents or fabricated data to the Lender.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "f) All rights and powers conferred on the Lender under this "
                    "Agreement shall be in addition and supplemental to any rights"
                    " the Lender has as a creditor against the Borrower under any law "
                    "for the time being in force and security documents and shall not be "
                    "in derogation thereof.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "5. General Terms and Conditions",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a) The Borrower/s are liable to repay the dues as per repayment "
                    "schedule whether demanded or not.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "b) The Borrower shall at all times adhere to the terms and conditions "
                    "set out in this Agreement and any amendments hereto.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "c) The Lender shall have the right to appropriate the "
                    "amounts paid by the Borrower in such manner, at the sole "
                    "discretion of the Lender.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "d) It is hereby accepted by the Parties that the amounts stated by the"
                    " Lender as due from the Borrower, shall be final and conclusive proof of"
                    " the correctness of any sum claimed by the Lender to be due from the Borrower "
                    "in respect of this Agreement, a statement of account made out from the books of the "
                    "Lender, without production of any voucher, documents or other papers whether in "
                    "support thereof or otherwise and the Parties "
                    "hereby agree that the same shall not be disputed by the Borrower",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "e) The right of the Lender to recover the dues from the Borrower "
                    "shall be exercised either by the Lender or its authorized representatives "
                    "and the Borrower hereby agrees to the same.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "f) The Borrower shall not give or pay to any other person who agrees "
                    "to incur any obligation for the Borrower in favour of the Lender,"
                    " any monies or other consideration or remuneration, whether by way of"
                    " commission, brokerage or fee or in any other form whatsoever or howsoever"
                    " for giving or confirming the personal guarantee or obligation.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "g) The Borrower shall permit the Lender to inspect the place of business or"
                    " his residence and also agrees to produce any documents / additional"
                    " documents as may be required by the Lender from time to time. Further,"
                    " the Borrower and the hereby agrees to permit the Lender and its "
                    "authorized representatives to contact / meet the Borrower at their "
                    "place of residence for collection of dues under this Agreement.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "h) Without prejudice to any other rights available to the Lender,"
                    " in the event the Borrower commits a default in the repayment of the Loan,"
                    " the Lender at its sole discretion shall make an application to the "
                    "Adjudicating Authority (as defined in the Code) and proceed under the "
                    "Insolvency and the Bankruptcy Code, 2016 (“Code”) in order to realize "
                    "the Loan Amount along with interest.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "i) The Borrower hereby agree that the Borrower may seek any further"
                    " loan facility from the Lender and any such further loan granted "
                    "by the Lender to the Borrower shall be repaid by the Borrower on "
                    "terms that may be communicated by the Lender to the Borrower from "
                    "time to time. For this purposes, the Parties hereby agree that any"
                    " confirmation for further loan facility as confirmed and accepted by "
                    "the Borrower over the phone is binding on the Borrower and that the"
                    " Borrower agrees to repay such loans granted based on oral confirmation "
                    "(voice call), together with interest, month on month by way of equated"
                    " monthly instalments as may be communicated by the Lender.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "6. Cost and Expenses",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a) The Borrower shall bear all costs and other expenses incurred in "
                    "relation to the completion of this Agreement and in complying with"
                    " the terms and conditions of this Agreement, including any and all costs"
                    " incurred in connection with this Agreement.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "7. Assignment",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a. It is expressly agreed that the Borrower shall not be entitled to "
                    "assign, either directly or indirectly, the obligations set out herein.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "b. The Lender shall be entitled to assign its rights and obligations"
                    " under this Agreement in part or in full to any third party.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "c. The Lender shall at any time, without reference to the Borrower"
                    " be entitled to securitize, "
                    "sell, assign, discount or transfer all or any of the Lender’s "
                    "rights and obligations under this Agreement together with the "
                    "underlying security to any person(s) of the choice of the Lender, "
                    "in whole or in part and in such manner as the Lender may decide. "
                    "Any such sale, assignment or transfer shall bind the Borrower conclusively.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "8. Term and Termination",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a. This Agreement shall become effective on execution",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "b. The Agreement shall stand terminated on the date the Borrower has "
                    "repaid the Loan Amount in full along with Interest, overdue interest, "
                    "Bank charges and other charges as mentioned in this Agreement, and fulfilled "
                    "all other obligations under the Agreement to the satisfaction of the Lender.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "c. The Borrower does not have the right to terminate this "
                    "Agreement in any situation except with the written consent"
                    " of the Lender, by repaying the entire amounts due to the Lender "
                    "under this Agreement.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: "9. Arbitration and Dispute Settlement",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "a) all disputes, differences and/or claims, arising out of this Agreement,"
                    " shall be settled by arbitration in accordance with the provisions of"
                    " the Arbitration and Conciliation Act, 1996 or any other statutory modification"
                    " or re-enactment for the time being in force and shall be conducted by a sole "
                    "arbitrator to be appointed by the Lender. The applicable law shall be Indian laws."
                    " In the event of incapacity or resignation or death of the sole arbitrator so appointed,"
                    " the Lender shall be entitled to appoint another arbitrator in place of the earlier "
                    "arbitrator, and the proceedings shall continue from the stage at which the predecessor"
                    " had left,",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "b) The award given by the arbitrator shall be final and binding"
                    " on the parties to this Agreement. The cost of the Arbitration"
                    " shall be borne with by the Party/ies, in accordance with the Award "
                    "passed by the Arbitrator.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "c. be sent to the Borrower to the address mentioned in this agreement "
                    "and to the Lender at its office address first hereinabove mentioned "
                    "and to the address mentioned in schedule, or to such other address as"
                    " either party may in writing hereafter notify to the other party.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "The Borrower have read the entire Agreement, constituting the above "
                    "clauses including the Loan details and the terms of repayment, the"
                    " fees and charges payable as clearly enumerated in the schedule to "
                    "this Agreement. The Borrower further confirm that the entire Agreement "
                    "is filled in their presence and that the contents provided herein is "
                    "explained in the language understood by the Borrower. The Borrower "
                    "further confirm having executed the Agreement, received a copy of the"
                    " same and agree to remit the dues in terms of the Schedule hereunder.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<LoanAgreementController>(
                          builder: (loanAgreementController) {
                        return Checkbox(
                          value: loanAgreementController.isCheckBox,
                          onChanged: loanAgreementController.onChange,
                          checkColor: MyTheme.white,
                          focusColor: MyTheme.mainColor,
                          activeColor: MyTheme.mainColor,
                        );
                      }),
                      const Expanded(
                        child: Text(
                          "I hereby agree that the above document belongs to me and "
                          "voluntarily give my consent to Prathima to utilize it as my "
                          "address proof for KYC on purpose only",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<LoanAgreementController>(builder: (controller) {
                    return Center(
                        child: CustomButton(
                      text: "Accept & Continue",
                      // fontSize: 16,
                      onTap: controller.isCheckBox ? () {
                        Get.toNamed(RouteHelper.loanApprovedScreen);
                      } : null,
                      // borderRadius: 20,
                      // horizontalPadding: 60,
                      // padding: 10,
                      color: controller.isCheckBox
                          ? MyTheme.mainColor
                          : MyTheme.grey_153,
                    ));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
