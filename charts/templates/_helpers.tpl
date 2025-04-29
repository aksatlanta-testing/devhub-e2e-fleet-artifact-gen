
{{- define "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.fullname" -}}
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


{{- define "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.labels" -}}
helm.sh/chart: {{ include "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.chart" . }}
{{ include "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7f20f7ff-1d7d-4d30-830c-bd58ff8ccbbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}