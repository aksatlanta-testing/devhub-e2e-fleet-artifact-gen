
{{- define "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.fullname" -}}
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


{{- define "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.labels" -}}
helm.sh/chart: {{ include "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.chart" . }}
{{ include "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfce6ed8-ea2d-42dc-bd1b-fff0f209fffe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}