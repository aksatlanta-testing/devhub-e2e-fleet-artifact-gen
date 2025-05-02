
{{- define "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.fullname" -}}
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


{{- define "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.labels" -}}
helm.sh/chart: {{ include "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.chart" . }}
{{ include "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod598d9db-fa1d-45ae-9f76-0f07d4520eed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}