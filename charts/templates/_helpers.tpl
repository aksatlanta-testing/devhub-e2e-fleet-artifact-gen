
{{- define "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.fullname" -}}
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


{{- define "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.labels" -}}
helm.sh/chart: {{ include "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.chart" . }}
{{ include "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoef651a0f-2af1-4854-a45f-cdfb1b1713dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}