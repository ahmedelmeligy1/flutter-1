import 'package:flutter/material.dart';
import 'post_job_screen.dart';

class ClientSetupScreen extends StatefulWidget {
  @override
  _ClientSetupScreenState createState() => _ClientSetupScreenState();
}

class _ClientSetupScreenState extends State<ClientSetupScreen> {

  // ---- المتغيرات ----
  String selectedBudget = '\$2,000 - \$10,000';
  String selectedGoal   = 'short';

  // الصناعات المختارة
  bool industryFintech      = true;
  bool industryHealthcare   = false;
  bool industryEcommerce    = false;
  bool industrySaaS         = false;
  bool industryCreativeArts = false;
  bool industryOther        = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'WorkY',
          style: TextStyle(
            color: Color(0xFF4F46E5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---- شريط التقدم ----
            Row(
              children: [
                Text(
                  'PROFILE CREATION',
                  style: TextStyle(fontSize: 11, color: Color(0xFF4F46E5), fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text('66% COMPLETE', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 6),
            LinearProgressIndicator(
              value: 0.66,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4F46E5)),
            ),
            SizedBox(height: 28),

            // ---- العنوان ----
            Center(
              child: Column(
                children: [
                  Text(
                    'Set up your client\nprofile',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tell us more about your hiring needs to help us find the right talent.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),

            // ---- Company Name ----
            Text('COMPANY NAME', style: labelStyle()),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'e.g., Acme Studio',
                hintStyle: TextStyle(color: Colors.grey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4F46E5)),
                ),
              ),
            ),
            SizedBox(height: 24),

            // ---- Industry ----
            Text('INDUSTRY/NICHE', style: labelStyle()),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [

                // كل صناعة زر منفصل
                industryButton('Fintech', industryFintech, () {
                  setState(() { industryFintech = !industryFintech; });
                }),

                industryButton('Healthcare', industryHealthcare, () {
                  setState(() { industryHealthcare = !industryHealthcare; });
                }),

                industryButton('E-commerce', industryEcommerce, () {
                  setState(() { industryEcommerce = !industryEcommerce; });
                }),

                industryButton('SaaS', industrySaaS, () {
                  setState(() { industrySaaS = !industrySaaS; });
                }),

                industryButton('Creative Arts', industryCreativeArts, () {
                  setState(() { industryCreativeArts = !industryCreativeArts; });
                }),

                industryButton('Other', industryOther, () {
                  setState(() { industryOther = !industryOther; });
                }),

              ],
            ),
            SizedBox(height: 24),

            // ---- Budget Range ----
            Text('TYPICAL PROJECT BUDGET RANGE', style: labelStyle()),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedBudget,
                isExpanded: true,
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBudget = newValue!;
                  });
                },
                items: [
                  DropdownMenuItem(value: '\$500 - \$2,000',       child: Text('\$500 - \$2,000')),
                  DropdownMenuItem(value: '\$2,000 - \$10,000',    child: Text('\$2,000 - \$10,000')),
                  DropdownMenuItem(value: '\$10,000 - \$50,000',   child: Text('\$10,000 - \$50,000')),
                  DropdownMenuItem(value: '\$50,000+',             child: Text('\$50,000+')),
                ],
              ),
            ),
            SizedBox(height: 24),

            // ---- Primary Goal ----
            Text('PRIMARY GOAL', style: labelStyle()),
            SizedBox(height: 8),

            // Short-term
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGoal = 'short';
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedGoal == 'short' ? Color(0xFF4F46E5) : Colors.grey[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedGoal == 'short' ? Color(0xFF4F46E5) : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      selectedGoal == 'short'
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selectedGoal == 'short' ? Colors.white : Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Short-term projects',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: selectedGoal == 'short' ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'Gig-based work & specific tasks',
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedGoal == 'short' ? Colors.white70 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),

            // Long-term
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGoal = 'long';
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedGoal == 'long' ? Color(0xFF4F46E5) : Colors.grey[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedGoal == 'long' ? Color(0xFF4F46E5) : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      selectedGoal == 'long'
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selectedGoal == 'long' ? Colors.white : Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Long-term hiring',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: selectedGoal == 'long' ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'Ongoing roles & team building',
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedGoal == 'long' ? Colors.white70 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),

            // ---- زر Continue ----
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4F46E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostJobScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue', style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // ---- Footer ----
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 95,
                    height: 32,
                    child: Stack(
                      children: [

                        Positioned(
                          left: 0,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF8B5CF6),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 20,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFEC4899),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 40,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF97316),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 60,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF4F46E5),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                '+12K',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Join 12,000+ top companies',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  // ---- ويدجت زر الصناعة ----
  Widget industryButton(String name, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF4F46E5) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // ---- ستايل العناوين الصغيرة ----
  TextStyle labelStyle() {
    return TextStyle(
      fontSize: 11,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );
  }
}
