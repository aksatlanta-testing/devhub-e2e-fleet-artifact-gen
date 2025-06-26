
{{- define "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.fullname" -}}
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


{{- define "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.labels" -}}
helm.sh/chart: {{ include "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.chart" . }}
{{ include "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaed5d347-27a4-435c-9829-835b9b76ab90.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}