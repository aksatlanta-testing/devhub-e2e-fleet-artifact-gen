
{{- define "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.fullname" -}}
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


{{- define "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.labels" -}}
helm.sh/chart: {{ include "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.chart" . }}
{{ include "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo38e696c0-6121-423e-9a42-222d76b3c22c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}