
{{- define "go-echoaeb2de29-47b3-4659-8046-26741ab28881.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaeb2de29-47b3-4659-8046-26741ab28881.fullname" -}}
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


{{- define "go-echoaeb2de29-47b3-4659-8046-26741ab28881.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaeb2de29-47b3-4659-8046-26741ab28881.labels" -}}
helm.sh/chart: {{ include "go-echoaeb2de29-47b3-4659-8046-26741ab28881.chart" . }}
{{ include "go-echoaeb2de29-47b3-4659-8046-26741ab28881.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaeb2de29-47b3-4659-8046-26741ab28881.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaeb2de29-47b3-4659-8046-26741ab28881.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}