import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/widgets/custom_button.dart';
import 'package:frontend/core/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final birthDateController = useTextEditingController();

    final selectedGender = useState<String>('M'); // M or F
    final selectedDate = useState<DateTime?>(null);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final authState = ref.watch(authProvider);

    Future<void> selectDate() async {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: AppTheme.accentTeal,
                onPrimary: AppTheme.midnightBlueDark,
                surface: AppTheme.midnightBlueLight,
                onSurface: Colors.white,
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        selectedDate.value = picked;
        birthDateController.text = DateFormat('dd/MM/yyyy').format(picked);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    label: 'Prénom',
                    controller: firstNameController,
                    prefixIcon: Icons.person_outline,
                    validator: (v) => v?.isEmpty == true ? 'Requis' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Nom',
                    controller: lastNameController,
                    prefixIcon: Icons.person_outline,
                    validator: (v) => v?.isEmpty == true ? 'Requis' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    validator: (v) =>
                        v?.contains('@') == true ? null : 'Email invalide',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Mot de passe',
                    controller: passwordController,
                    isPassword: true,
                    prefixIcon: Icons.lock_outline,
                    validator: (v) =>
                        (v?.length ?? 0) < 6 ? 'Min 6 caractères' : null,
                  ),
                  const SizedBox(height: 16),

                  // Gender Selection
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.midnightBlueLight,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedGender.value,
                        isExpanded: true,
                        dropdownColor: AppTheme.midnightBlueLight,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        items: const [
                          DropdownMenuItem(value: 'M', child: Text('Homme')),
                          DropdownMenuItem(value: 'F', child: Text('Femme')),
                        ],
                        onChanged: (val) {
                          if (val != null) selectedGender.value = val;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Date Picker
                  InkWell(
                    onTap: selectDate,
                    child: IgnorePointer(
                      child: CustomTextField(
                        label: 'Date de naissance',
                        controller: birthDateController,
                        prefixIcon: Icons.calendar_today,
                        validator: (v) => v?.isEmpty == true ? 'Requis' : null,
                      ),
                    ),
                  ),
                  /*  */

                  const SizedBox(height: 24),

                  if (authState.hasError) ...[
                    Text(
                      authState.error.toString(),
                      style: const TextStyle(color: AppTheme.errorRed),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                  ],

                  CustomButton(
                    text: 'Créer mon compte',
                    isLoading: authState.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          selectedDate.value != null) {
                        ref.read(authProvider.notifier).register(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              gender: selectedGender.value,
                              birthDate: selectedDate.value!,
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
