
{{- define "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.fullname" -}}
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


{{- define "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.labels" -}}
helm.sh/chart: {{ include "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.chart" . }}
{{ include "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod467b7e0-eefe-456a-a12b-e49cb755517b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}