
{{- define "go-echo99a2524e-ad3b-4670-b886-d4481601b995.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99a2524e-ad3b-4670-b886-d4481601b995.fullname" -}}
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


{{- define "go-echo99a2524e-ad3b-4670-b886-d4481601b995.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99a2524e-ad3b-4670-b886-d4481601b995.labels" -}}
helm.sh/chart: {{ include "go-echo99a2524e-ad3b-4670-b886-d4481601b995.chart" . }}
{{ include "go-echo99a2524e-ad3b-4670-b886-d4481601b995.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo99a2524e-ad3b-4670-b886-d4481601b995.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo99a2524e-ad3b-4670-b886-d4481601b995.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}