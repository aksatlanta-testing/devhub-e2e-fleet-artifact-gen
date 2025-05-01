
{{- define "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.fullname" -}}
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


{{- define "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.labels" -}}
helm.sh/chart: {{ include "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.chart" . }}
{{ include "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7b225dd-6a6d-42d2-a22c-6a29adbd818c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}