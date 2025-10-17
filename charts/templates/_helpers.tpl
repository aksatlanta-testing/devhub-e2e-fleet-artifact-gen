
{{- define "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.fullname" -}}
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


{{- define "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.labels" -}}
helm.sh/chart: {{ include "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.chart" . }}
{{ include "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo790a9738-7bfd-4636-9db4-073e51aa61df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}