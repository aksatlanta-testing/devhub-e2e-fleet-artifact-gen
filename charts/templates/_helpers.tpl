
{{- define "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.fullname" -}}
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


{{- define "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.labels" -}}
helm.sh/chart: {{ include "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.chart" . }}
{{ include "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0296f38-83f9-4c82-b1ce-6f5a2c8d7370.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}