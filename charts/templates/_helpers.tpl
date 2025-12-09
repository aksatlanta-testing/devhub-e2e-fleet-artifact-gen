
{{- define "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.fullname" -}}
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


{{- define "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.labels" -}}
helm.sh/chart: {{ include "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.chart" . }}
{{ include "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfb75a9a-0b63-4ae1-8a0b-2e610dbdd10b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}