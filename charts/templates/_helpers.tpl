
{{- define "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.fullname" -}}
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


{{- define "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.labels" -}}
helm.sh/chart: {{ include "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.chart" . }}
{{ include "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbce98a6-cb48-48e7-83ef-51bd807c6e18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}