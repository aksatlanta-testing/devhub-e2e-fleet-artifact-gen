
{{- define "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.fullname" -}}
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


{{- define "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.labels" -}}
helm.sh/chart: {{ include "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.chart" . }}
{{ include "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocbdbbe61-ef1c-4e19-8fa5-773a2c0e4327.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}