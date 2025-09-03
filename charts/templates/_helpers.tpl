
{{- define "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.fullname" -}}
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


{{- define "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.labels" -}}
helm.sh/chart: {{ include "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.chart" . }}
{{ include "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7faf7ca0-4385-4c9f-a0e9-f0663bdff35b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}