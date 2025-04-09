
{{- define "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.labels" -}}
helm.sh/chart: {{ include "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.chart" . }}
{{ include "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo03b2b84b-2ba8-4707-ba12-adb11f003384.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}