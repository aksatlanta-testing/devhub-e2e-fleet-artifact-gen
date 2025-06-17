
{{- define "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.fullname" -}}
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


{{- define "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.labels" -}}
helm.sh/chart: {{ include "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.chart" . }}
{{ include "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeec55f9d-8e60-4534-8f79-85ee3faad42f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}