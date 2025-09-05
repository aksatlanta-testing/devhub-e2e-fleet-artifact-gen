
{{- define "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.fullname" -}}
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


{{- define "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.labels" -}}
helm.sh/chart: {{ include "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.chart" . }}
{{ include "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3bb45391-ba76-43b2-b251-46cbc2709a33.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}